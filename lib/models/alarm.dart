import 'package:alarm_app/models/profile.dart';

class Alarm {
  final String alarmName;
  final String alarmTime;
  final int alarmId;
  final List<String> alarmPeriod;
  final bool isNew;
  final String settingTime;
  final bool isActive;
  final Profile profile;

  Alarm({
    required this.alarmName,
    required this.alarmTime,
    required this.alarmId,
    required this.alarmPeriod,
    required this.isNew,
    required this.settingTime,
    required this.profile,
    this.isActive = false,
  });

  String get name => alarmName;

  int get id => alarmId;

  String get time => alarmTime;

  List<String> get period => alarmPeriod;
}
