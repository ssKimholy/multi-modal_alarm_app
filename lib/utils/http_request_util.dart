import 'dart:convert';
import 'dart:io';
import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/models/chat_profile.dart';
import 'package:alarm_app/utils/date_time_util.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class HttpRequestUtil {
  static final String URL = dotenv.env['SERVER_IP']!; // env 파일로 따로 빼기.
  static final AudioPlayer _audioPlayer = AudioPlayer();

  // static Future<void> initRole() async {
  //   final response = await http.post(
  //     Uri.parse('$URL/api/mvp/init-role'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{}),
  //   );

  //   print(response.statusCode);
  //   print(response.body);
  // }

  static Future<Map<String, dynamic>> getUserInfo(String phoneNumber) async {
    final response = await http.get(
      Uri.parse('$URL/api/mvp/phone/$phoneNumber'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Fail to find!');
    }
  }

  static Future<String> loginUser(String userId, String userPw) async {
    final response = await http.post(
      Uri.parse('$URL/api/mvp/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'memberId': userId,
        'password': userPw,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['access_token'];
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Fail to login');
    }
  }

  static Future<void> registerUser(String userId, String userPw,
      String userName, String userPhoneNumber, String userDeviceCode) async {
    final response = await http.post(
      Uri.parse('$URL/api/mvp/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "deviceKey": userDeviceCode,
        "memberId": userId,
        "memberName": userName,
        "password": userPw,
        "phone": userPhoneNumber,
      }),
    );

    if (response.statusCode == 201) {
      print('success!!');
      return;
    } else {
      print(response.statusCode);
      throw Exception('Fail to register');
    }
  }

  static Future<List<dynamic>> fetchAllReceivedAlarms(String userId) async {
    print(userId);
    final response = await http.get(
      Uri.parse('$URL/api/mvp/user/alarm/list/friend/$userId'),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      print(data);
      return data;
    } else {
      throw Exception('Failed to load user Alarm');
    }
  }

  static Future<List<dynamic>> fetchSentAlarms(
      String receiverId, String userId) async {
    final response = await http.get(
      Uri.parse(
          '$URL/api/mvp/user/alarm/list/sender/$userId?receiverId=$receiverId'), // end point 별로 get
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      print('friends $data');
      return data;
    } else {
      throw Exception('Failed to load user Alarm');
    }
  }

  static Future<List<dynamic>> fetchFriends(String userId) async {
    final response = await http.get(
      Uri.parse(
          '$URL/api/mvp/friend/list/$userId'), // 역시 친구를 가져오는 end point로 설정
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      print('hhe ${response.statusCode}');
      throw Exception('Failed to load user friends');
    }
  }

  static Future<Map<String, dynamic>> setFriend(
      String targetPhoneNumber, String userId) async {
    final response = await http.post(
      Uri.parse('$URL/api/mvp/friend/register'), // 역시 친구를 추가하는 end point로 설정
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'memberId': userId,
        'phone': targetPhoneNumber,
      }),
    );

    if (response.statusCode == 200) {
      print('suces');
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to set user friend');
    }
  }

  static Future<void> setAlarm(
      Alarm alarm, String filePath, String takerId, String giverId) async {
    print(alarm.alarmTime);
    var dio = Dio();
    var formData = FormData.fromMap({
      'alarmName': alarm.alarmName,
      'days': alarm.alarmPeriod,
      'receiverId': takerId,
      'memberId': giverId,
      'time': alarm.alarmTime.split(' ')[1],
      'voice':
          await MultipartFile.fromFile(filePath, filename: alarm.alarmName),
      // 다른 form 데이터 추가 가능
    });

    final response = await dio.post('$URL/api/mvp/user/alarm', data: formData);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('okok');
    } else {
      print(response.statusCode);
      print(response.data);
    }
  }

  static Future<String> getAlarmVoice(int alarmId) async {
    Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$alarmId.acc';
    final File file = File(filePath);

    if (!await file.exists()) {
      try {
        var dio = Dio();

        final response = await dio.download(
            '$URL/api/mvp/user/alarm/voice/$alarmId', filePath);

        print(response.statusCode);
      } catch (e) {
        print('Failed to download file: $e');
      }
    }

    return filePath;

    // await _audioPlayer.play(UrlSource(filePath));

    // if (response.statusCode == 200) {

    //   var response
    // } else {
    //   print('hhe ${response.statusCode}');
    //   throw Exception('Failed to load voice');
    // }
  }

  static void setStopAlarmVoice() async {
    await _audioPlayer.stop();
  }

  // 알람 정보 가져오기
  static Future<dynamic> getAlarmInfo(String alarmId) async {
    print('enter alarm info get');
    final response = await http.get(
      Uri.parse('$URL/api/mvp/user/alarm/$alarmId'),
    );
    print('middle of the alarm info get');

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      print('http ok $data');
      return data;
    } else {
      print('hhe ${response.statusCode}');
      throw Exception('Failed to load alarm info');
    }
  }

  static Future<void> setAlarmCheck(int alarmId) async {
    final response = await http.get(
      Uri.parse('$URL/api/mvp/user/alarm/success/$alarmId'),
    );

    if (response.statusCode == 200) {
      print('http ok');
    } else {
      print('hhe ${response.statusCode}');
      throw Exception('Failed to load alarm info');
    }
  }
}
