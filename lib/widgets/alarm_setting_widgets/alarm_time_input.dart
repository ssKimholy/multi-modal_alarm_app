import 'package:alarm_app/utils/date_time_util.dart';
import 'package:flutter/material.dart';

import 'accurate_time_setting.dart';

class AlarmTimeInput extends StatelessWidget {
  final String alarmTime;
  final Function(String) setAlarmTime;

  const AlarmTimeInput({
    super.key,
    required this.alarmTime,
    required this.setAlarmTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '알람이 울릴 시간',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Noto_Sans_KR',
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              child: Center(
                  child: AccurateTimeSetting(
                setAlarmTime: setAlarmTime,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
