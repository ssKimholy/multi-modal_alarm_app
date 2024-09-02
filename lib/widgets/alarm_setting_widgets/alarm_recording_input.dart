import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AlarmRecordingInput extends StatelessWidget {
  final bool isRecording;
  final bool isPlaying;
  final String? recordedFilePath;
  final Function onStartRecord;
  final Function onStopRecord;
  final Function onStartPlay;
  final Function onStopPlay;
  final Duration duration;

  const AlarmRecordingInput(
      {super.key,
      required this.isRecording,
      required this.isPlaying,
      required this.onStartRecord,
      required this.onStopRecord,
      required this.onStartPlay,
      required this.onStopPlay,
      required this.recordedFilePath,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Column(
        children: [
          const Text(
            // '당신의 목소리로 알람음을 설정해주세요.',
            'Set the Alarm Sound with Your Voice.',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Noto_Sans_KR',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      isRecording ? onStopRecord() : onStartRecord();
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xff898585).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                        child: Icon(
                          isRecording ? Icons.stop : Icons.mic,
                          color: const Color(0xffC93D35).withOpacity(0.8),
                          size: 46,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                recordedFilePath == ''
                    ? const SizedBox()
                    : SizedBox(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xff3AD277).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 12.0),
                              child: GestureDetector(
                                onTap: () {
                                  isPlaying ? onStopPlay() : onStartPlay();
                                },
                                child: isPlaying
                                    ? Icon(Icons.pause,
                                        color: Colors.white38.withOpacity(0.8),
                                        size: 26)
                                    : Icon(Icons.play_arrow,
                                        color: Colors.white38.withOpacity(0.8),
                                        size: 26),
                              ),
                            ),
                            const SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}분 ${(duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}초',
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Noto_Sans_KR',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
