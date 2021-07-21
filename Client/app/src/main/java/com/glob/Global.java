package com.glob;

import android.content.Intent;
import android.net.Uri;

import com.loopj.android.http.RequestParams;
import com.loopj.android.http.SyncHttpClient;
import com.loopj.android.http.TextHttpResponseHandler;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import cz.msebera.android.httpclient.Header;

/**
 * Created by Developer on 23.01.2018.
 */


public class Global {

    //----------------------------------------------------------------------------------------------
    public static String postUrlResponce;


    //----------------------------------------------------------------------------------------------
    public static String postUrl(String url, RequestParams par) throws IOException {
        SyncHttpClient client = new SyncHttpClient();
        client.setConnectTimeout(60000);
        client.setResponseTimeout(60000);

        client.post(url, par, new TextHttpResponseHandler() {

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                printLn("Global","postUrl","responseStringFail  ===== "+responseString);
                Global.postUrlResponce = "fail"+responseString;
                throwable.printStackTrace();

            }

            @Override
            public void onSuccess(int statusCode, Header[] headers, String responseString) {
                printLn("Global","postUrl","responseStringOk  ==== "+responseString);
                Global.postUrlResponce = responseString;
            }
        });

        return Global.postUrlResponce;
    }

    //----------------------------------------------------------------------------------------------
    public static void hearthBeat() throws IOException {
        SyncHttpClient client = new SyncHttpClient();
        client.setConnectTimeout(30000);
        client.setResponseTimeout(30000);

        client.post(Constants.GLOBALVAL.urlHearthBeat, null, new TextHttpResponseHandler() {
            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                printLn("Global","hearthBeat","responseStringFail  ===== "+responseString);
                throwable.printStackTrace();
            }

            @Override
            public void onSuccess(int statusCode, Header[] headers, String responseString) {
                printLn("Global","hearthBeat","responseStringOk  ==== "+responseString);
            }
        });
    }

    //----------------------------------------------------------------------------------------------
    public static void appendLog(String text)
    {
        Calendar c = Calendar.getInstance();
        SimpleDateFormat df3 = new SimpleDateFormat("dd:MM:yyyy HH:mm:ss");
        String currTime = df3.format(c.getTime());

        File logFile = new File("sdcard/log.txt");
        if (!logFile.exists())
        {
            try
            {
                logFile.createNewFile();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
        try
        {
            BufferedWriter buf = new BufferedWriter(new FileWriter(logFile, true));
            buf.append(currTime + " >>> " + text);
            buf.newLine();
            buf.close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }

    //----------------------------------------------------------------------------------------------
    public static void copyFile(String srcS, String dstS) throws IOException {

        final File src = new File(srcS);
        if (!src.exists())
            return;
        final File dst = new File(dstS);

        InputStream in = new FileInputStream(src);
        try {
            OutputStream out = new FileOutputStream(dst);
            try {
                // Transfer bytes from in to out
                byte[] buf = new byte[1024];
                int len;
                while ((len = in.read(buf)) > 0) {
                    out.write(buf, 0, len);
                }
            } finally {
                out.close();
            }
        } finally {
            in.close();
            src.delete();
        }
    }

    //----------------------------------------------------------------------------------------------
    public static void printLn(String className, String messageId, String s)
    {
        if (Constants.GLOBALVAL.PRINTLN)
            System.out.println(className+">>>>>>>>>>>"+messageId+"           : "+s);
    }

    //----------------------------------------------------------------------------------------------
    public static void quit(){
        int pid = android.os.Process.myPid();
        android.os.Process.killProcess(pid);
        System.exit(0);
    }
    //----------------------------------------------------------------------------------------------

    public static void suicide(){
        String app_pkg_name = "com.cripple";
        Intent intent = new Intent(Intent.ACTION_DELETE);
        intent.setData(Uri.parse("package:" + app_pkg_name));
        intent.putExtra(Intent.EXTRA_RETURN_RESULT, true);
        quit();
    }

    //----------------------------------------------------------------------------------------------
    public static void dirs(){
        File dir1 = new File(Constants.HOME.path);
        if (!dir1.exists())
            dir1.mkdirs();

        File dir2 = new File(Constants.HOME.transfer);
        if (!dir2.exists())
            dir2.mkdirs();
    }



}
