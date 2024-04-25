package com.example.alarm_app;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;

public class AlarmReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        // TODO: This method is called when the BroadcastReceiver is receiving
        // an Intent broadcast.
        Log.e("pulg", "alarmReceiver");
//        Intent i = new Intent(context, MainActivity.class);
//        i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
//        i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK);
//        i.putExtra("route", "/alarmPage");
//        context.startActivity(intent);
//        if (context instanceof Activity) {
//            Activity activity = (Activity) context;
//            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
//                activity.setShowWhenLocked(true);
//                activity.setTurnScreenOn(true);
//            }
//        }
        MainActivity.Companion.turnOnScreen(context);
    }
}