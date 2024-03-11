import 'package:alarm_app/utils/date_time_util.dart';
import 'package:flutter/material.dart';

import '../models/alarm.dart';

class PreviousAlarm extends StatefulWidget {
  final Alarm alarm;

  const PreviousAlarm({super.key, required this.alarm});

  @override
  State<PreviousAlarm> createState() => _PreviousAlarmState();
}

class _PreviousAlarmState extends State<PreviousAlarm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/images/png/play_icon.png',
            width: 35,
            height: 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.alarm.name,
                style: TextStyle(
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.9)),
              ),
              Text(
                '${widget.alarm.profile.name}님이 김철수님께 설정하신 알람',
                style: TextStyle(
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff898585).withOpacity(0.8)),
              )
            ],
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            widget.alarm.settingTime.split(' ')[0],
            style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontFamily: 'Noto_Sans_KR',
                fontSize: 14,
                fontWeight: FontWeight.w300),
          ),
          Text(
            DateTimeUtils.convertKorTime(widget.alarm.settingTime),
            style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontFamily: 'Noto_Sans_KR',
                fontSize: 14,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
