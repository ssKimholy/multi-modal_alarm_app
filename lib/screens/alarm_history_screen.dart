import 'package:alarm_app/widgets/previous_alarms.dart';
import 'package:flutter/material.dart';

import '../models/alarm.dart';
import '../models/profile.dart';
import '../utils/date_time_util.dart';

class AlarmHistoryScreen extends StatelessWidget {
  final List<Alarm> alarms = [
    Alarm(
        alarmName: '고혈압 약 먹기',
        alarmTime: '07:30',
        alarmId: 1,
        alarmPeriod: ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'],
        isNew: false,
        settingTime: DateTimeUtils.formatCurrentTime(),
        profile: Profile('이경영', 'assets/images/leeG.svg')),
    Alarm(
        alarmName: '혈압 재기',
        alarmTime: '07:30',
        alarmId: 2,
        alarmPeriod: ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'],
        isNew: true,
        settingTime: DateTimeUtils.formatCurrentTime(),
        profile: Profile('허은아', 'assets/images/huhE.svg')),
    Alarm(
        alarmName: '비타민 먹기',
        alarmTime: '12:00',
        alarmId: 3,
        alarmPeriod: ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'],
        isNew: false,
        settingTime: DateTimeUtils.formatCurrentTime(),
        profile: Profile('허은아', 'assets/images/huhE.svg')),
    Alarm(
        alarmName: '목요일 심리상담',
        alarmTime: '15:00',
        alarmId: 4,
        alarmPeriod: ['thu'],
        isNew: false,
        settingTime: DateTimeUtils.formatCurrentTime(),
        profile: Profile('오은영', 'assets/images/ohE.svg')),
    Alarm(
        alarmName: '혈압 재기',
        alarmTime: '19:00',
        alarmId: 5,
        alarmPeriod: ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'],
        isNew: false,
        settingTime: DateTimeUtils.formatCurrentTime(),
        profile: Profile('김경영', 'assets/images/kimG.svg')),
    Alarm(
        alarmName: 'ㄱㄱ',
        alarmTime: '21:00',
        alarmId: 6,
        alarmPeriod: ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'],
        isNew: false,
        settingTime: DateTimeUtils.formatCurrentTime(),
        profile: Profile('김경영', 'assets/images/kimG.svg')),
  ];

  AlarmHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/png/alarm_icon.png',
                  width: 24,
                  height: 24,
                ),
              ),
              const Expanded(
                flex: 8,
                child: Text(
                  '기록된 알람',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Noto_Sans_KR',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        strokeAlign: 1.0),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        '찾기',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Noto_Sans_KR',
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                      Image.asset(
                        'assets/images/png/search_icon.png',
                        width: 18,
                        height: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return PreviousAlarm(alarm: alarms[index]);
              },
              separatorBuilder: (context, index) {
                return Container(
                  width: 330,
                  height: 1,
                  color: const Color(0xff90B483).withOpacity(0.25),
                );
              },
              itemCount: alarms.length),
        ),
      ],
    );
  }
}
