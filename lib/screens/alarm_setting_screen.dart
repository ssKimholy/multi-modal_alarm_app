import 'package:alarm_app/widgets/alarm_setting_widgets/alarm_name_input.dart';
import 'package:alarm_app/widgets/alarm_setting_widgets/alarm_period_input.dart';
import 'package:alarm_app/widgets/alarm_setting_widgets/alarm_recording_input.dart';
import 'package:alarm_app/widgets/alarm_setting_widgets/alarm_time_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class AlarmSettingScreen extends StatefulWidget {
  final String takerName;
  late String alarmName;
  late String alarmTime;
  late List<String> alarmPeriod = [];
  late bool isRecording;
  late bool isPlaying;

  AlarmSettingScreen({
    super.key,
    required this.takerName,
    this.alarmName = '',
    this.alarmTime = '',
    this.isRecording = false,
    this.isPlaying = false,
  });

  @override
  State<AlarmSettingScreen> createState() => _AlarmSettingScreenState();
}

class _AlarmSettingScreenState extends State<AlarmSettingScreen> {
  final TextEditingController controller = TextEditingController();
  FlutterSoundRecorder? _recorder;
  FlutterSoundPlayer? _player;
  String? _recordedFilePath;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _player = FlutterSoundPlayer();
    _recordedFilePath = '';
    _init();
  }

  Future<void> _init() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('마이크 권한이 필요합니다.');
    }
    await _recorder!.openRecorder();
  }

  Future<void> _startRecording() async {
    await _recorder!.startRecorder(toFile: 'myRecording.aac');
    setState(() {
      widget.isRecording = true;
    });
  }

  Future<void> _stopRecording() async {
    final path = await _recorder!.stopRecorder();
    setState(() {
      widget.isRecording = false;
      _recordedFilePath = path;
    });
  }

  Future<void> _startPlayer() async {
    if (_recordedFilePath == '') {
      return;
    }
    await _player!.openPlayer();
    await _player!.startPlayer(
      fromURI: _recordedFilePath,
      whenFinished: () {
        _stopPlayer();
      },
    );
    setState(() {
      widget.isPlaying = true;
    });
  }

  Future<void> _stopPlayer() async {
    await _player!.stopPlayer();
    setState(() {
      widget.isPlaying = false;
    });
  }

  @override
  void dispose() {
    _recorder!.closeRecorder();
    _recorder = null;
    _player!.closePlayer();
    _player = null;
    super.dispose();
  }

  setAlarmName(String name) {
    setState(() {
      widget.alarmName = name;
    });
  }

  setAlarmTime(String time) {
    setState(() {
      widget.alarmTime = time;
    });
  }

  setAlarmPeriod(String day) {
    setState(() {
      widget.alarmPeriod.contains(day)
          ? widget.alarmPeriod.remove(day)
          : widget.alarmPeriod.add(day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.5,
        toolbarHeight: 30,
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
              Text(
                '${widget.takerName}님에게 알람 설정 하기',
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
        child: Column(
          children: [
            AlarmNameInput(controller: controller, setAlarmName: setAlarmName),
            AlarmTimeInput(
                alarmTime: widget.alarmTime, setAlarmTime: setAlarmTime),
            AlarmPeriodInput(
                alarmPeriod: widget.alarmPeriod,
                setAlarmPeriod: setAlarmPeriod),
            AlarmRecordingInput(
              isRecording: widget.isRecording,
              isPlaying: widget.isPlaying,
              onStartRecord: _startRecording,
              onStopRecord: _stopRecording,
              onStartPlay: _startPlayer,
              onStopPlay: _stopPlayer,
              recordedFilePath: _recordedFilePath,
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                // alarm setting logic
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 155.0, vertical: 12.0),
                decoration: BoxDecoration(
                    color: const Color(0xff3AD277),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  '알람 설정',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
