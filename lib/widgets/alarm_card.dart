import 'dart:io';

import 'package:alarm_app/utils/date_time_util.dart';
import 'package:alarm_app/utils/http_request_util.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/alarm.dart';

class AlarmCard extends StatefulWidget {
  final Alarm alarm;

  const AlarmCard({
    Key? key,
    required this.alarm,
  }) : super(key: key);

  @override
  State<AlarmCard> createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  final AudioPlayer _audioPlayer = AudioPlayer();

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
          color: widget.alarm.isActive
              ? const Color(0xff3AD277).withOpacity(0.8)
              : const Color(0xff3AD277).withOpacity(0.5),
          fontFamily: 'Noto_Sans_KR',
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      );
    }

    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: widget.alarm.isActive
              ? const Color(0xff4F4A4A)
              : const Color(0xff4F4A4A).withOpacity(0.7),
          fontSize: 12,
          fontFamily: 'Noto_Sans_KR',
          fontWeight: FontWeight.w300,
        ),
        children: weeks.map((day) {
          return TextSpan(
            text: '$day ',
            style: TextStyle(
                color: korWeek.contains(day)
                    ? widget.alarm.isActive
                        ? const Color(0xff3AD277).withOpacity(0.8)
                        : const Color(0xff3AD277).withOpacity(0.4)
                    : widget.alarm.isActive
                        ? const Color(0xff4F4A4A)
                        : const Color(0xff4F4A4A).withOpacity(0.5)),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        color: widget.alarm.isActive
            ? const Color(0xfffafafa)
            : const Color(0xfffafafa).withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: widget.alarm.isActive
                ? Colors.grey.withOpacity(0.3)
                : Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: widget.alarm.isActive ? 5 : 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              String filePath =
                  await HttpRequestUtil.getAlarmVoice(widget.alarm.alarmId);
              _audioPlayer.play(UrlSource(filePath));
            },
            child: Column(
              children: [
                Text(
                  widget.alarm.time.substring(0, 5),
                  style: TextStyle(
                      color: widget.alarm.isActive
                          ? const Color(0xff4F4A4A)
                          : const Color(0xff4F4A4A).withOpacity(0.4),
                      fontSize: 32,
                      fontFamily: 'Noto_Sans_KR',
                      fontWeight: FontWeight.w500),
                ),
                weekString(widget.alarm.period),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    widget.alarm.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: widget.alarm.isActive
                          ? Colors.black.withOpacity(0.5)
                          : Colors.black.withOpacity(0.2),
                      fontFamily: 'Noto_Sans_KR',
                    ),
                    overflow:
                        TextOverflow.ellipsis, // 텍스트가 컨테이너를 넘어갈 경우, "..."으로 표시
                    maxLines: 2, // 최대 줄 수를 제한
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    await HttpRequestUtil.setIsActiveAlarm(
                        widget.alarm.alarmId);
                    setState(() {
                      widget.alarm.isActive = !widget.alarm.isActive;
                    });
                  },
                  child: Icon(
                    widget.alarm.isActive
                        ? Icons.toggle_on
                        : Icons.toggle_off_outlined,
                    // color: widget.alarm.isActive
                    color: const Color(0xff3AD277).withOpacity(0.8),
                    // : Colors.,
                    size: 45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
