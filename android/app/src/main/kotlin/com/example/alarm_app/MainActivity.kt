package com.example.alarm_app

import android.app.Activity
import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.health.connect.datatypes.units.Power
import android.os.Build
import android.os.Bundle
import android.os.PowerManager
import android.util.Log
import android.view.WindowManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity() {
    companion object {
        private const val CHANNEL = "com.example.alarmApp/channel"

        fun turnOnScreen(context: Context) {
            val pm: PowerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager

            val sCpuWakeLock: PowerManager.WakeLock = pm.newWakeLock(
                PowerManager.ON_AFTER_RELEASE or PowerManager.PARTIAL_WAKE_LOCK, "app:alarm"
            )

            sCpuWakeLock.acquire()

            val intent = Intent(context, MainActivity::class.java)
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK)
            intent.putExtra("route", "/alarmPage");
            context.startActivity(intent)
        }
    }

    override fun onStart() {
        super.onStart()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
            setShowWhenLocked(true);
            setTurnScreenOn(true);
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        window.addFlags(
            WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
        )


        val route = intent.getStringArrayExtra("route")

        flutterEngine?.dartExecutor?.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        if (flutterEngine == null) {
            Log.e("pulg", "it's null")
        } else {
            Log.e("pulg", "it's it")
        }

        flutterEngine?.dartExecutor?.binaryMessenger?.let { MethodChannel(it, CHANNEL).invokeMethod("getRoute", route) }

        Log.e("pulg", "hiru")
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            Log.e("pulg", call.toString())
        }
        
    }
}
