package com.cripple;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

import com.glob.Global;

public class WakeUp extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        Global.printLn("WakeUp", "onReceive","");
        if (Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())) {
            Intent serviceIntent = new Intent(context, MainActivity.class);
            context.startActivity(serviceIntent);
            Global.printLn("WakeUp", "onReceive","started");
        }
    }
}
