import 'package:alarm_app/utils/date_time_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccurateTimeSetting extends StatelessWidget {
  final Function(String) setAlarmTime;

  const AccurateTimeSetting({
    super.key,
    required this.setAlarmTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xfffafafa),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).copyWith().size.height / 3.5,
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
          // GestureDetector(
          //   onTap: () {
          //     setIsTimeSetted();
          //   },
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(vertical: 10.0),
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //         color: const Color(0xff3AD277),
          //         borderRadius: BorderRadius.circular(10.0)),
          //     alignment: Alignment.center,
          //     child: const DefaultTextStyle(
          //         style: TextStyle(
          //             fontSize: 16.0,
          //             fontFamily: 'Noto_Sans_KR',
          //             fontWeight: FontWeight.w600,
          //             color: Colors.white),
          //         child: Text('설정 완료')),
          //   ),
          // )
        ],
      ),
    );
  }
}
