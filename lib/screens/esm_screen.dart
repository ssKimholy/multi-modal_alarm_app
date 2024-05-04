import 'dart:ffi';

import 'package:alarm_app/screens/home_screen.dart';
import 'package:alarm_app/utils/http_request_util.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ESMScreen extends StatefulWidget {
  ESMScreen({super.key, this.isVoiceRun = false});

  List<int> answers = [-1, -1, -1];
  int currentFlag = 0;
  bool isVoiceRun;

  @override
  State<ESMScreen> createState() => _ESMScreenState();
}

class _ESMScreenState extends State<ESMScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _init_();
  }

  void _init_() async {
    final prefs = await SharedPreferences.getInstance();
    int alarmId = prefs.getInt('alarmId')!;
    HttpRequestUtil.setAlarmCheck(alarmId);
  }

  onClickVoiceRun() async {
    final prefs = await SharedPreferences.getInstance();

    if (widget.isVoiceRun) {
      _audioPlayer.stop();
      updateVoiceRun(false);
    } else {
      String filePath =
          await HttpRequestUtil.getAlarmVoice(prefs.getInt("alarmId")!);
      _audioPlayer.onPlayerComplete.listen((event) {
        updateVoiceRun(false);
      });
      _audioPlayer.play(UrlSource(filePath));
      updateVoiceRun(true);
    }

    print(widget.isVoiceRun);
  }

  void updateVoiceRun(bool isRunning) {
    setState(() {
      widget.isVoiceRun = isRunning;
    });
  }

  Widget checkButton(String description, int num, int flag) {
    return SizedBox(
      width: 60,
      height: 80,
      child: GestureDetector(
          onTap: () {
            setState(() {
              widget.currentFlag = flag;
              widget.answers[flag] = num;
            });
          },
          child: Column(
            children: [
              Icon(
                widget.answers[flag] == num
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: Colors.white,
              ),
              const SizedBox(
                height: 7.0,
              ),
              Text(description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 10,
                      fontWeight: FontWeight.w700))
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.5,
        toolbarHeight: 30,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                'Use Survey',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      widget.isVoiceRun
                          ? Icons.stop_circle_outlined
                          : Icons.play_circle_outline_rounded,
                      color: const Color(0xff3AD277),
                      size: 60,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              '녹음된 음성을 듣고 난 직후 답변해 주세요.',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Noto_Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 35.0,
            ),
            Expanded(
              child: ListView(
                children: [
                  const Center(
                    child: Text('기분이 가라앉거나, 우울하거나, 희망이 없다고 느꼈다.',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Noto_Sans_KR',
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      checkButton('전혀 없음', 0, 0),
                      checkButton('몇 시간 동안', 1, 0),
                      checkButton('하루의 절반 이상', 2, 0),
                      checkButton('거의 하루 종일', 3, 0),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Center(
                    child: Text('평소 하던 일에 대한 흥미가 없어지거나 즐거움을 느끼지 못했다.',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Noto_Sans_KR',
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      checkButton('전혀 없음', 0, 1),
                      checkButton('몇 시간 동안', 1, 1),
                      checkButton('하루의 절반 이상', 2, 1),
                      checkButton('거의 하루 종일', 3, 1),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Center(
                    child: Text('상대방이 나를 챙겨준다는 느낌을 받았다.',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Noto_Sans_KR',
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      checkButton('전혀 그렇지 않다\n', 1, 2),
                      checkButton('그렇지 않다\n', 2, 2),
                      checkButton('보통이다\n', 3, 2),
                      checkButton('그렇다\n', 4, 2),
                      checkButton('매우 그렇다\n', 5, 2),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            GestureDetector(
              onTap: () {
                if (!widget.answers.contains(-1)) {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ), (route) => false);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 60.0, vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xff3AD277),
                ),
                child: const Text(
                  '확인',
                  style: TextStyle(
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
