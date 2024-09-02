import 'package:alarm_app/main.dart';
import 'package:alarm_app/screens/esm_screen.dart';
import 'package:alarm_app/screens/home_screen.dart';
import 'package:alarm_app/utils/date_time_util.dart';
import 'package:alarm_app/utils/http_request_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({
    super.key,
  });

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
    setFixedScreen();
    playAlarmSound();
  }

  void setFixedScreen() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFixed', true);
    print('alarm');
  }

  Future<Map<String, dynamic>> loadAlarmInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'alarmName': prefs.getString('alarmName') ?? '',
      'alarmTime': prefs.getString('alarmTime') ?? '',
      'alarmId': prefs.getInt('alarmId') ?? 0,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                  const Text(
                    'PM',
                    style: TextStyle(
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
              FutureBuilder(
                future: loadAlarmInfo(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final alarmInfo = snapshot.data!;
                    return Text(
                      alarmInfo["alarmName"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 90.0,
              ),
              isAlarmStop
                  ? const SizedBox()
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
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            // esm 평가 페이지로 이동!
                            return ESMScreen();
                          },
                        ), (route) => false);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xff3AD277),
                        ),
                        child: const Text(
                          'OK',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
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

  // onClickVoiceRun(alarmId) {
  //   setState(() {
  //     isVoiceRun = !isVoiceRun;
  //     // 녹음된 사운드 재생
  //     HttpRequestUtil.getAlarmVoice(alarmId);
  //   });
  // }
}
