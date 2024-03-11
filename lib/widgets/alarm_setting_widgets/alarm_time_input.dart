import 'package:alarm_app/utils/date_time_util.dart';
import 'package:flutter/material.dart';

import 'accurate_time_setting.dart';

class AlarmTimeInput extends StatelessWidget {
  final String alarmTime;
  final Function(String) setAlarmTime;

  const AlarmTimeInput(
      {super.key, required this.alarmTime, required this.setAlarmTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
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
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: alarmTime == '1시간 뒤'
                        ? const Color(0xff3AD277).withOpacity(0.5)
                        : const Color(0xff898585).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      setAlarmTime('1시간 뒤');
                    },
                    child: const Text(
                      '1시간 뒤',
                      style: TextStyle(
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: alarmTime == '2시간 뒤'
                        ? const Color(0xff3AD277).withOpacity(0.5)
                        : const Color(0xff898585).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      setAlarmTime('2시간 뒤');
                    },
                    child: const Text('2시간 뒤',
                        style: TextStyle(
                            fontFamily: 'Noto_Sans_KR',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: alarmTime == '3시간 뒤'
                        ? const Color(0xff3AD277).withOpacity(0.5)
                        : const Color(0xff898585).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      setAlarmTime('3시간 뒤');
                    },
                    child: const Text('3시간 뒤',
                        style: TextStyle(
                            fontFamily: 'Noto_Sans_KR',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: (alarmTime != '1시간 뒤' &&
                            alarmTime != '2시간 뒤' &&
                            alarmTime != '3시간 뒤' &&
                            alarmTime != '')
                        ? const Color(0xff3AD277).withOpacity(0.5)
                        : const Color(0xff898585).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return AccurateTimeSetting(
                                  setAlarmTime: setAlarmTime,
                                );
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              barrierColor: Colors.white.withOpacity(0.85)));
                    },
                    child: const Text('정확한 시간 설정',
                        style: TextStyle(
                            fontFamily: 'Noto_Sans_KR',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          alarmTime == ''
              ? const SizedBox(
                  height: 37.0,
                )
              : Center(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    width: 70,
                    decoration: BoxDecoration(
                        color: const Color(0x0fa8b1ac),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Text(
                      DateTimeUtils.convertKorTime(alarmTime),
                      style: TextStyle(
                          color: const Color(0xff358957).withOpacity(0.8),
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
