package com.example.alarm_app;

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.util.Log
import com.example.alarm_app.AlarmReceiver
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage
import java.util.Calendar

class MyFirebaseMessagingService : FirebaseMessagingService() {

    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        super.onMessageReceived(remoteMessage)

        Log.e("pulg", "onMessage")
        remoteMessage.notification?.title?.let { Log.e("pulg", it) }
        // 메시지 데이터 처리. 예를 들어, 알람 시간 설정에 필요한 데이터를 여기서 파싱합니다.
        if (remoteMessage.data.isNotEmpty()) {
            Log.e("pulg", "notEmpty")

        }
        setAlarm()
        Log.e("pulg", "end")
    }

    private fun setAlarm() {
        // AlarmManager를 사용하여 알람 설정
        Log.e("pulg", "setAlarm")
        val alarmManager = getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val alarmIntent = Intent(this, AlarmReceiver::class.java) // AlarmReceiver는 알람 시간에 실행될 BroadcastReceiver입니다.
        val pendingIntent = PendingIntent.getBroadcast(this, 0, alarmIntent, PendingIntent.FLAG_MUTABLE)

        // 알람 시간 설정
        val triggerTime = System.currentTimeMillis() + 5 * 1000

        // API 19 이상에서는 setExact를 사용하여 정확한 시간에 알람이 울리도록 설정
        alarmManager.setExact(AlarmManager.RTC_WAKEUP, triggerTime, pendingIntent)

        Log.e("pulg", "endSetAlarm")
    }
}
