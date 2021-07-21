package com.test;

import android.app.Service;
import android.content.Intent;
import android.graphics.Bitmap;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.IBinder;
import android.os.StrictMode;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;

import com.cripple.MainActivity;
import com.cripple.Temp;
import com.glob.Constants;
import com.glob.Global;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

public class Blind extends Service {

    Timer timer = null;
    TimerTask timerTask;


    public Blind() {
    }

    @Override
    public IBinder onBind(Intent intent) {
        // TODO: Return the communication channel to the service.
        throw new UnsupportedOperationException("Not yet implemented");
    }

    @Override
    public void onCreate() {
        Global.printLn("Blind","onCreate", "");
        super.onCreate();
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        showNotification();
    }

    private void showNotification() {
        if (startService(new Intent(this, Temp.class)) == null)
            throw new RuntimeException("Couldn't find " + Temp.class.getSimpleName());
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        Global.printLn("Blind", "onStartCommand","");
        time();
        return START_STICKY;
    }

    private void showMain(){
        Global.printLn("Blind", "showMain","");
        Intent mainIntent = new Intent(this, BlindActivity.class);
        mainIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        startActivity(mainIntent);
    }

    //----------------------------------------------------------------------------------------------
    private void time() {
                timer = new Timer();
                timerTask = new TimerTask() {

            @Override
            public void run() {
                Global.printLn("Blind", "time","Blind time start");
                showMain();
            }
        };
        timer.scheduleAtFixedRate(timerTask, 1000, 30000);
    }


    public void takeScreenshot() {
        Global.printLn("Main","takeScr = >>>>>>>>", "1");

        Date now = new Date();
        android.text.format.DateFormat.format("yyyy-MM-dd_hh:mm:ss", now);



        WindowManager mWindowManager = null;
        WindowManager.LayoutParams mLayoutParams = null;


        //let's assume that an event occurred        
        mLayoutParams.softInputMode=WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN;

        mLayoutParams.gravity = Gravity.TOP| Gravity.CENTER;
        int flag=0
                |WindowManager.LayoutParams.FLAG_FORCE_NOT_FULLSCREEN
                |WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED
                |WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM
                ;
        mLayoutParams.flags=flag;

        mWindowManager.updateViewLayout(MainActivity, mLayoutParams);

        try {
            String mPath = Constants.HOME.path + now+"test.jpg";
            Global.printLn("Global","takeScreenshot","mPath>>>>>>>>>>>>>"+mPath);

            // create bitmap screen capture
            View v1 = getWindow().getDecorView().getRootView();
            v1.setDrawingCacheEnabled(true);
            Bitmap bitmap = Bitmap.createBitmap(v1.getDrawingCache());
            v1.setDrawingCacheEnabled(false);

            File imageFile = new File(mPath);

            FileOutputStream outputStream = new FileOutputStream(imageFile);
            int quality = 100;
            bitmap.compress(Bitmap.CompressFormat.JPEG, quality, outputStream);
            outputStream.flush();
            outputStream.close();


            MediaScannerConnection.scanFile(this,
                    new String[] { imageFile.toString() }, null,
                    new MediaScannerConnection.OnScanCompletedListener() {
                        public void onScanCompleted(String path, Uri uri) {
                            Global.printLn("addImageGallery","takeScr = >>>>>>>>", path);
                            //Global.printLn("addImageGallery","takeScr = >>>>>>>>", uri);

                            Log.i("ExternalStorage", "Scanned " + path + ":");
                            Log.i("ExternalStorage", "-> uri=" + uri);
                        }
                    });
        } catch (Throwable e) {
            // Several error may come out with file handling or DOM
            e.printStackTrace();
        }
    }

}
