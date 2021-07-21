package com.test;

import android.graphics.Bitmap;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

import com.glob.Constants;
import com.glob.Global;
import com.cripple.R;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

public class BlindActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_blind);
    }

    @Override
    protected void onStart() {
        Global.printLn("BlindActivity","onStart()","");
        super.onStart();
    }

    @Override
    protected void onPause() {
        Global.printLn("BlindActivity","onResume()","");
        super.onPause();

        takeScreenshot();
        finish();
    }

    public void takeScreenshot() {
        Global.printLn("Main","takeScr = >>>>>>>>", "1");

        Date now = new Date();
        android.text.format.DateFormat.format("yyyy-MM-dd_hh:mm:ss", now);

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
