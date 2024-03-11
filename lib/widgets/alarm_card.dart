import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/alarm.dart';

class AlarmCard extends StatelessWidget {
  final Alarm alarm;

  const AlarmCard({
    Key? key,
    required this.alarm,
  }) : super(key: key);

  List<String> convertEngToKor(List<String> week) {
    Map<String, String> dayTranslations = {
      'mon': '월',
      'tue': '화',
      'wed': '수',
      'thu': '목',
      'fri': '금',
      'sat': '토',
      'sun': '일',
    };

    return week.map((day) {
      return dayTranslations[day] ?? day;
    }).toList();
  }

  Widget weekString(List<String> week) {
    List<String> weeks = ['월', '화', '수', '목', '금', '토', '일'];
    List<String> korWeek = convertEngToKor(week);

    if (korWeek.length == 7) {
      return Text(
        '매일',
        style: TextStyle(
          color: const Color(0xff3AD277).withOpacity(0.8),
          fontFamily: 'Noto_Sans_KR',
          fontSize: 10,
          fontWeight: FontWeight.w300,
        ),
      );
    }

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Color(0xff4F4A4A),
          fontSize: 10,
          fontFamily: 'Noto_Sans_KR',
          fontWeight: FontWeight.w300,
        ),
        children: weeks.map((day) {
          return TextSpan(
            text: '$day ',
            style: TextStyle(
              color: korWeek.contains(day)
                  ? const Color(0xff3AD277).withOpacity(0.8)
                  : const Color(0xff4F4A4A),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 55),
      decoration: BoxDecoration(
        color: const Color(0xfffafafa),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                ClipOval(
                  child: SvgPicture.asset(
                    alarm.profile.imageURL,
                    fit: BoxFit.cover,
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                Text(
                  alarm.profile.name,
                  style: const TextStyle(
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 11,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 120,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  alarm.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5),
                    fontFamily: 'Noto_Sans_KR',
                  ),
                ),
                Text(
                  alarm.time,
                  style: const TextStyle(
                      color: Color(0xff4F4A4A),
                      fontSize: 28,
                      fontFamily: 'Noto_Sans_KR',
                      fontWeight: FontWeight.w500),
                ),
                weekString(alarm.period),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
