import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlarmPeriodInput extends StatelessWidget {
  final List<String> alarmPeriod;
  final Function(String) setAlarmPeriod;

  const AlarmPeriodInput(
      {super.key, required this.alarmPeriod, required this.setAlarmPeriod});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '알람을 반복할 요일',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Noto_Sans_KR',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setAlarmPeriod('mon');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmPeriod.contains('mon')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '월',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setAlarmPeriod('tue');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmPeriod.contains('tue')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '화',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setAlarmPeriod('wed');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmPeriod.contains('wed')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '수',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setAlarmPeriod('thu');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmPeriod.contains('thu')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '목',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setAlarmPeriod('fri');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmPeriod.contains('fri')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '금',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setAlarmPeriod('sat');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmPeriod.contains('sat')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '토',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setAlarmPeriod('sun');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmPeriod.contains('sun')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '일',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
