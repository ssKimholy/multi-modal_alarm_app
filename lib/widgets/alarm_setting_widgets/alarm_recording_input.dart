import 'package:flutter/material.dart';

class AlarmRecordingInput extends StatelessWidget {
  final bool isRecording;
  final bool isPlaying;
  final Function setIsRecording;
  final Function setIsPlaying;

  const AlarmRecordingInput(
      {super.key,
      required this.isRecording,
      required this.isPlaying,
      required this.setIsRecording,
      required this.setIsPlaying});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Column(
        children: [
          const Text(
            '당신의 목소리로 알람음을 설정해주세요.',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Noto_Sans_KR',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 85.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffDFF9F0),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                      onTap: () {
                        setIsRecording();
                      },
                      child: isRecording
                          ? const Icon(
                              Icons.keyboard_voice_outlined,
                              color: Color(0xff3ad277),
                              size: 26,
                            )
                          : const Icon(
                              Icons.keyboard_voice,
                              color: Color(0xff3ad277),
                              size: 26,
                            )),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffDFF9F0),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                      onTap: () {
                        setIsPlaying();
                      },
                      child: isPlaying
                          ? const Icon(Icons.pause,
                              color: Color(0xff3AD277), size: 26)
                          : const Icon(Icons.play_arrow,
                              color: Color(0xff3AD277), size: 26)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
            decoration: BoxDecoration(
                color: const Color(0x0fa8b1ac),
                borderRadius: BorderRadius.circular(12.0)),
            child: const Text(
              // 녹음 여부에 따라 텍스트 변환
              '음성 녹음을 기다리는 중 입니다.',
              style: TextStyle(
                  color: Color(0xff898585),
                  fontFamily: 'Noto_Sans_KR',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
