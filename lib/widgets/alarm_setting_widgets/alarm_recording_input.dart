import 'package:flutter/material.dart';

class AlarmRecordingInput extends StatelessWidget {
  final bool isRecording;
  final bool isPlaying;
  final String? recordedFilePath;
  final Function onStartRecord;
  final Function onStopRecord;
  final Function onStartPlay;
  final Function onStopPlay;

  const AlarmRecordingInput(
      {super.key,
      required this.isRecording,
      required this.isPlaying,
      required this.onStartRecord,
      required this.onStopRecord,
      required this.onStartPlay,
      required this.onStopPlay,
      required this.recordedFilePath});

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isRecording
                        ? const Color(0xfffafafa)
                        : const Color(0xff898585).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: GestureDetector(
                      onTap: () {
                        isRecording ? onStopRecord() : onStartRecord();
                      },
                      child: isRecording
                          ? Icon(
                              Icons.stop_circle,
                              color: const Color(0xffC93D35).withOpacity(0.8),
                              size: 46,
                            )
                          : Icon(
                              Icons.keyboard_voice,
                              color: const Color(0xffC93D35).withOpacity(0.8),
                              size: 46,
                            )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                recordedFilePath == ''
                    ? const SizedBox()
                    : Container(
                        decoration: BoxDecoration(
                          color: isRecording
                              ? const Color(0xfffafafa)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 7.0),
                        child: GestureDetector(
                            onTap: () {
                              isPlaying ? onStopPlay() : onStartPlay();
                            },
                            child: isPlaying
                                ? Icon(Icons.pause,
                                    color: const Color(0xffC93D35)
                                        .withOpacity(0.8),
                                    size: 46)
                                : Icon(Icons.play_arrow,
                                    color: const Color(0xffC93D35)
                                        .withOpacity(0.8),
                                    size: 46)),
                      ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
