import 'package:alarm_app/widgets/custom_app_bar.dart';
import 'package:alarm_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../models/alarm.dart';
import '../models/profile.dart';
import '../utils/date_time_util.dart';
import '../widgets/alarm_card.dart';
import '../widgets/introduction_of_page.dart';

class AlarmPageScreen extends StatelessWidget {
  final List<Alarm> alarms = [
    Alarm(
        alarmName: '고혈압 약 먹기',
        alarmTime: '07:30',
        alarmPeriod: ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'],
        isNew: false,
        settingTime: DateTimeUtils.formatCurrentTime(),
        profile: Profile('이경영', 'assets/images/svg/leeG.svg')),
    Alarm(
        alarmName: '혈압 재기',
        alarmTime: '07:30',
        alarmPeriod: ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'],
        isNew: true,
        settingTime: DateTimeUtils.formatCurrentTime(),
        profile: Profile('허은아', 'assets/images/svg/huhE.svg')),
    Alarm(
        alarmName: '비타민 먹기',
        alarmTime: '12:00',
        alarmPeriod: ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'],
        isNew: false,
        settingTime: DateTimeUtils.formatCurrentTime(),
        profile: Profile('허은아', 'assets/images/svg/huhE.svg')),
    Alarm(
        alarmName: '목요일 심리상담',
        alarmTime: '15:00',
        alarmPeriod: ['thu'],
        isNew: false,
        settingTime: DateTimeUtils.formatCurrentTime(),
        profile: Profile('오은영', 'assets/images/svg/ohE.svg')),
    Alarm(
        alarmName: '혈압 재기 가자가자가자가자가자가자가자가자가자가자가자가자가자가자가자가자가자가자가자',
        alarmTime: '19:00',
        alarmPeriod: ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'],
        isNew: false,
        settingTime: DateTimeUtils.formatCurrentTime(),
        profile: Profile('김경영', 'assets/images/svg/kimG.svg')),
    Alarm(
        alarmName: 'ㄱㄱ',
        alarmTime: '21:00',
        alarmPeriod: ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'],
        isNew: false,
        settingTime: DateTimeUtils.formatCurrentTime(),
        profile: Profile('김경영', 'assets/images/svg/kimG.svg')),
  ];

  AlarmPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Volarm',
        marginVar: 48.0,
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: Column(
        children: [
          const IntroductionOfPage(
            introTitle: '오늘의 알람',
            introSubTitle: '알람을 클릭하여 음성을 들어보세요.',
            buttonText: '모든 알람 보기',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: alarms.length,
              itemBuilder: (context, index) {
                return AlarmCard(alarm: alarms[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
