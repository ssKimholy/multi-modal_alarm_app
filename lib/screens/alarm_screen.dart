import 'package:alarm_app/main.dart';
import 'package:alarm_app/utils/date_time_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  bool isAlarmStop = false;
  bool isVoiceRun = false;
  String currentTime =
      DateTimeUtils.convertKorTime(DateTimeUtils.formatCurrentTime());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playAlarmSound();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    currentTime.substring(0, 2),
                    style: const TextStyle(
                        fontFamily: 'Noto_Sans_KR',
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(currentTime.substring(2),
                      style: const TextStyle(
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.white))
                ],
              ),
              const SizedBox(
                height: 80.0,
              ),
              const Text(
                '고혈압 약 복용',
                style: TextStyle(
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 90.0,
              ),
              isAlarmStop
                  ? Column(
                      children: [
                        const Text('녹음된 소리 재생',
                            style: TextStyle(
                                fontFamily: 'Noto_Sans_KR',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        const SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            onClickVoiceRun();
                          },
                          child: Icon(
                            isVoiceRun
                                ? Icons.stop_circle_outlined
                                : Icons.play_circle_outline_rounded,
                            color: const Color(0xff3AD277),
                            size: 80,
                          ),
                        )
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        onClickAlarmStop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: const Color(0xff3AD277)),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 36,
                        ),
                      )),
              const SizedBox(
                height: 100.0,
              ),
              isAlarmStop
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xff3AD277),
                        ),
                        child: const Text('확인',
                            style: TextStyle(
                                fontFamily: 'Noto_Sans_KR',
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ));
  }

  onClickAlarmStop() {
    setState(() {
      isAlarmStop = true;
      stopAlarmSound();
    });
  }

  onClickVoiceRun() {
    setState(() {
      isVoiceRun = !isVoiceRun;
      // 녹음된 사운드 재생
    });
  }
}
