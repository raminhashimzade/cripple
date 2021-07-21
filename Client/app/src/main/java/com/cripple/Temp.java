package com.cripple;

import android.app.ActivityManager;
import android.app.Notification;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;

import com.glob.Constants;
import com.glob.Global;

public class Temp extends Service {

    public static Notification notification;

    public Temp() {
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        Global.printLn("Temp","onStartCommand","");

        if (Runner.instance == null)
            throw new RuntimeException(Runner.class.getSimpleName() + " not running");

        if (horseRunning(Runner.class))
            startForeground(Runner.instance);

        startForeground(this);
        stopForeground(true);
        stopSelf();

        return START_NOT_STICKY;
    }

    private static void startForeground(Service service) {
        notification = new Notification.Builder(service).getNotification();
        service.startForeground(Constants.NOTIFICATION_ID.FOREGROUND_SERVICE, notification);
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

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
