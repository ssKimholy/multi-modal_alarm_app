import 'dart:io';

import 'package:alarm_app/utils/date_time_util.dart';
import 'package:alarm_app/utils/http_request_util.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/alarm.dart';

class AlarmCard extends StatelessWidget {
  final Alarm alarm;
  final AudioPlayer _audioPlayer = AudioPlayer();

  AlarmCard({
    Key? key,
    required this.alarm,
  }) : super(key: key);

  List<String> convertEngToKor(List<String> week) {
    Map<String, String> dayTranslations = {
      'MON': '월',
      'TUES': '화',
      'WED': '수',
      'THURS': '목',
      'FRI': '금',
      'SAT': '토',
      'SUN': '일',
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
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      );
    }

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Color(0xff4F4A4A),
          fontSize: 12,
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
    return GestureDetector(
      onTap: () async {
        String filePath = await HttpRequestUtil.getAlarmVoice(alarm.alarmId);
        _audioPlayer.play(UrlSource(filePath));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(
                    alarm.time.substring(0, 5),
                    style: const TextStyle(
                        color: Color(0xff4F4A4A),
                        fontSize: 32,
                        fontFamily: 'Noto_Sans_KR',
                        fontWeight: FontWeight.w500),
                  ),
                  weekString(alarm.period),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text(
                      alarm.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.5),
                        fontFamily: 'Noto_Sans_KR',
                      ),
                      overflow: TextOverflow
                          .ellipsis, // 텍스트가 컨테이너를 넘어갈 경우, "..."으로 표시
                      maxLines: 2, // 최대 줄 수를 제한
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
