import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/models/profile.dart';
import 'package:alarm_app/utils/date_time_util.dart';
import 'package:alarm_app/utils/global_var.dart';
import 'package:alarm_app/utils/http_request_util.dart';
import 'package:alarm_app/widgets/alarm_setting_widgets/alarm_name_input.dart';
import 'package:alarm_app/widgets/alarm_setting_widgets/alarm_period_input.dart';
import 'package:alarm_app/widgets/alarm_setting_widgets/alarm_recording_input.dart';
import 'package:alarm_app/widgets/alarm_setting_widgets/alarm_time_input.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class AlarmSettingScreen extends StatefulWidget {
  final String takerName;
  final String takerId;
  late String alarmName;
  late String alarmTime;
  late List<String> alarmPeriod = [];
  late bool isRecording;
  late bool isPlaying;
  late String audioName;
  late Duration? duration;

  AlarmSettingScreen({
    super.key,
    required this.takerName,
    required this.takerId,
    this.alarmName = '',
    this.alarmTime = '',
    this.isRecording = false,
    this.isPlaying = false,
    this.audioName = '',
    this.duration = const Duration(),
  });

  @override
  State<AlarmSettingScreen> createState() => _AlarmSettingScreenState();
}

class _AlarmSettingScreenState extends State<AlarmSettingScreen> {
  final TextEditingController controller = TextEditingController();
  FlutterSoundRecorder? _recorder;
  FlutterSoundPlayer? _player;
  AudioPlayer? audioPlayer;
  String? _recordedFilePath;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _player = FlutterSoundPlayer();
    audioPlayer = AudioPlayer();
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
    await audioPlayer!.dispose();

    await _recorder!.startRecorder(
      toFile: 'myRecording.aac',
      codec: Codec.aacADTS,
    );
    setState(() {
      widget.isRecording = true;
    });
  }

  Future<void> _stopRecording() async {
    audioPlayer = AudioPlayer();
    final path = await _recorder!.stopRecorder();
    await audioPlayer!.setSourceUrl(path!);
    var len = await audioPlayer!.getDuration();
    setState(() {
      print(len);
      widget.duration = len;
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

    print(widget.alarmTime);
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
    final global = Provider.of<GlobalVar>(context);

    return Scaffold(
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
              Text(
                '${widget.takerName}님에게 알람 설정',
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
        child: ListView(
          children: [
            AlarmNameInput(controller: controller, setAlarmName: setAlarmName),
            AlarmTimeInput(
              alarmTime: widget.alarmTime,
              setAlarmTime: setAlarmTime,
            ),
            AlarmPeriodInput(
                alarmPeriod: widget.alarmPeriod,
                setAlarmPeriod: setAlarmPeriod),
            const SizedBox(
              height: 15.0,
            ),
            AlarmRecordingInput(
              isRecording: widget.isRecording,
              isPlaying: widget.isPlaying,
              onStartRecord: _startRecording,
              onStopRecord: _stopRecording,
              onStartPlay: _startPlayer,
              onStopPlay: _stopPlayer,
              recordedFilePath: _recordedFilePath,
              duration: widget.duration!,
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                // alarm setting logic
                HttpRequestUtil.setAlarm(
                    Alarm(
                        alarmName: widget.alarmName,
                        alarmTime: widget.alarmTime,
                        alarmId: 0,
                        alarmPeriod: widget.alarmPeriod,
                        isNew: false,
                        isActive: true,
                        settingTime: DateTimeUtils.formatCurrentTime(),
                        profile: Profile(global.getUserName, '')),
                    _recordedFilePath!,
                    widget.takerId,
                    global.getUserId,
                    '${widget.duration?.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(widget.duration?.inSeconds.remainder(60)).toString().padLeft(2, '0')}');
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: BoxDecoration(
                    color: const Color(0xff3AD277),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  '완료',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
