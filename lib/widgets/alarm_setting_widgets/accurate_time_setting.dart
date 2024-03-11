import 'package:alarm_app/utils/date_time_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccurateTimeSetting extends StatelessWidget {
  final Function(String) setAlarmTime;

  const AccurateTimeSetting({super.key, required this.setAlarmTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Noto_Sans_KR',
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  child: Text('정확한 시간 설정')),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 35.0,
          ),
          SizedBox(
            height: MediaQuery.of(context).copyWith().size.height / 2.5,
            child: CupertinoDatePicker(
              use24hFormat: false,
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (value) {
                setAlarmTime(DateTimeUtils.dateTimeToString(value));
              },
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff3AD277),
                  borderRadius: BorderRadius.circular(10.0)),
              alignment: Alignment.center,
              child: const DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Noto_Sans_KR',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  child: Text('설정 완료')),
            ),
          )
        ],
      ),
    );
  }
}
