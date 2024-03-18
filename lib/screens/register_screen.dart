import 'package:alarm_app/widgets/user_input_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  late String email;
  late String password;
  late String nickName;
  late String phoneNumber;

  RegisterScreen(
      {super.key,
      this.email = '',
      this.password = '',
      this.nickName = '',
      this.phoneNumber = ''});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  setEmail(String email) {
    setState(() {
      widget.email = email;
    });
  }

  setPassword(String pw) {
    setState(() {
      widget.password = pw;
    });
  }

  setNickname(String nickname) {
    setState(() {
      widget.nickName = nickname;
    });
  }

  setPhoneNumber(String number) {
    setState(() {
      widget.phoneNumber = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 30,
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
                  onText: setEmail),
              const SizedBox(
                height: 35.0,
              ),
              UserInputWidget(
                  controller: passwordController,
                  description: '비밀번호',
                  hintText: '비밀번호 입력',
                  onText: setPassword),
              const SizedBox(
                height: 35.0,
              ),
              UserInputWidget(
                  controller: nicknameController,
                  description: '닉네임',
                  hintText: '닉네임 입력',
                  onText: setNickname),
              const SizedBox(
                height: 35.0,
              ),
              UserInputWidget(
                  controller: phoneNumberController,
                  description: '전화번호',
                  hintText: '전화번호 입력',
                  onText: setPhoneNumber),
              const SizedBox(
                height: 90.0,
              ),
              GestureDetector(
                onTap: () {
                  // 회원가입 logic
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
