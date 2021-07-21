package com.cripple;

import android.media.MediaRecorder;
import android.os.Build;

import java.io.File;
import java.io.IOException;

/**
 * Created by Developer on 23.01.2018.
 */

public class RecAudio {

    public static MediaRecorder recorder = null;

    //----------------------------------------------------------------------------------------------
    public static void startRec(String fileDir, String fileName) {
        File dir = new File(fileDir);
        if (!dir.exists())
            dir.mkdirs();


        String filePath = fileDir + fileName;

        recorder = new MediaRecorder();
        recorder.setAudioSource(MediaRecorder.AudioSource.MIC);
        recorder.setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
            recorder.setAudioEncoder(MediaRecorder.AudioEncoder.HE_AAC);
            recorder.setAudioEncodingBitRate(48000);
        } else {
            recorder.setAudioEncoder(MediaRecorder.AudioEncoder.AAC);
            recorder.setAudioEncodingBitRate(64000);
        }
        recorder.setOutputFile(filePath);

        try {
            recorder.prepare();
        } catch (IOException e) {
            e.printStackTrace();
        }
        recorder.start();   // Recording is now started
    }

    //----------------------------------------------------------------------------------------------
    public static void stopRec() {
        if (recorder != null) {
            recorder.stop();
            recorder.reset();
            recorder.release();
            recorder = null;
        }
    }
}
