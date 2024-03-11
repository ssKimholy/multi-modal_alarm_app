import 'package:flutter/material.dart';

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
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: alarmPeriod.contains('mon')
                        ? const Color(0xff3AD277).withOpacity(0.5)
                        : const Color(0xff898585).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      setAlarmPeriod('mon');
                    },
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
                Container(
                  decoration: BoxDecoration(
                    color: alarmPeriod.contains('tue')
                        ? const Color(0xff3AD277).withOpacity(0.5)
                        : const Color(0xff898585).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      setAlarmPeriod('tue');
                    },
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
                Container(
                  decoration: BoxDecoration(
                    color: alarmPeriod.contains('wed')
                        ? const Color(0xff3AD277).withOpacity(0.5)
                        : const Color(0xff898585).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      setAlarmPeriod('wed');
                    },
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
                Container(
                  decoration: BoxDecoration(
                    color: alarmPeriod.contains('thu')
                        ? const Color(0xff3AD277).withOpacity(0.5)
                        : const Color(0xff898585).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      setAlarmPeriod('thu');
                    },
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
                Container(
                  decoration: BoxDecoration(
                    color: alarmPeriod.contains('fri')
                        ? const Color(0xff3AD277).withOpacity(0.5)
                        : const Color(0xff898585).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      setAlarmPeriod('fri');
                    },
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
                Container(
                  decoration: BoxDecoration(
                    color: alarmPeriod.contains('sat')
                        ? const Color(0xff3AD277).withOpacity(0.5)
                        : const Color(0xff898585).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      setAlarmPeriod('sat');
                    },
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
                Container(
                  decoration: BoxDecoration(
                    color: alarmPeriod.contains('sun')
                        ? const Color(0xff3AD277).withOpacity(0.5)
                        : const Color(0xff898585).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      setAlarmPeriod('sun');
                    },
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
            ),
          )
        ],
      ),
    );
  }
}
