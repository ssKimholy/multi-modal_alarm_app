import 'package:alarm_app/utils/global_var.dart';
import 'package:alarm_app/utils/http_request_util.dart';
import 'package:alarm_app/widgets/user_input_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  setEmail(String email, global) {
    global.setUserId(email);
  }

  setPassword(String pw, global) {
    global.setUserPw(pw);
  }

  setNickname(String nickname, global) {
    global.setUserName(nickname);
  }

  setPhoneNumber(String number, global) {
    global.setUserPhoneNumber(number);
  }

  Future<String> getMyDeviceToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token!;
  }

  void setToken(global) async {
    String token = await getMyDeviceToken();
    global.setDeviceToken(token);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalVar>(context);
    setToken(global);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 30,
        automaticallyImplyLeading: false,
        flexibleSpace: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Icon(
                    Icons.arrow_back,
                    size: 26,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                '회원가입',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: 45.0,
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
          child: Column(
            children: [
              UserInputWidget(
                  controller: emailController,
                  description: '이메일',
                  hintText: '이메일 입력',
                  onText: (text) => setEmail(text, global)),
              const SizedBox(
                height: 35.0,
              ),
              UserInputWidget(
                  controller: passwordController,
                  description: '비밀번호',
                  hintText: '비밀번호 입력',
                  onText: (text) => setPassword(text, global)),
              const SizedBox(
                height: 35.0,
              ),
              UserInputWidget(
                  controller: nicknameController,
                  description: '닉네임',
                  hintText: '닉네임 입력',
                  onText: (text) => setNickname(text, global)),
              const SizedBox(
                height: 35.0,
              ),
              UserInputWidget(
                  controller: phoneNumberController,
                  description: '전화번호',
                  hintText: '전화번호 입력',
                  onText: (text) => setPhoneNumber(text, global)),
              const SizedBox(
                height: 90.0,
              ),
              GestureDetector(
                onTap: () async {
                  print('touch ${global.getDeviceToken}');

                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('phone-num', global.getUserPhoneNumber);
                  // 회원가입 logic
                  HttpRequestUtil.registerUser(
                      global.getUserId,
                      global.getUserPw,
                      global.getUserName,
                      global.getUserPhoneNumber,
                      global.getDeviceToken);

                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: double.infinity,
                    height: 42.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: const Color(0xff3AD277),
                    ),
                    child: const Text(
                      '회원가입',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
