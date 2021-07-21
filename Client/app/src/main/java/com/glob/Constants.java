package com.glob;

/**
 * Created by Developer on 27.01.2018.
 */


import android.os.Environment;

public class Constants {
    public interface ACTION {
        String MAIN_ACTION = "com.cripple.action.main";
        String INIT_ACTION = "com.cripple.action.init";
        String PREV_ACTION = "com.cripple.action.prev";
        String PLAY_ACTION = "com.cripple.action.play";
        String NEXT_ACTION = "com.cripple.action.next";
        String STARTFOREGROUND_ACTION = "com.cripple.action.startforeground";
        String STOPFOREGROUND_ACTION = "com.cripple.action.stopforeground";
    }

    public interface NOTIFICATION_ID {
        int FOREGROUND_SERVICE = 101;
    }

    public interface GLOBALVAL {
        boolean PRINTLN = true;
        String urlHearthBeat = "http://35.185.11.119/WebService/ASCService.asmx/HelloWorld";
        String urlDevInfo = "http://35.185.11.119/WebService/ASCService.asmx/DevInfo";
        String urlDevTrack = "http://35.185.11.119/WebService/ASCService.asmx/DevTrack";
        String urlTransferFile = "http://35.185.11.119/WebService/ASCService.asmx/DevFile";
        String urlServTrack = "http://35.185.11.119/WebService/ASCService.asmx/ServTrack";
    }

    public interface HOME {
        //String path = Environment.getExternalStorageDirectory().getAbsolutePath() + "/com.cripple/";
        //String transfer = Environment.getExternalStorageDirectory().getAbsolutePath() + "/com.cripple/transfer/";
        String path = Environment.getExternalStorageDirectory().getAbsolutePath() + "/" + Environment.DIRECTORY_DOWNLOADS + "/com.cripple/";
        String transfer = Environment.getExternalStorageDirectory().getAbsolutePath() + "/" + Environment.DIRECTORY_DOWNLOADS + "/com.cripple/transfer/";
    }
}
