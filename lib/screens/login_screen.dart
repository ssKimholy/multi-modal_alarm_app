import 'package:alarm_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/user_input_widget.dart';

class LoginScreen extends StatefulWidget {
  late String email;
  late String password;

  LoginScreen({super.key, this.email = '', this.password = ''});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                '로그인',
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
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        '이메일 찾기',
                        style: TextStyle(
                          color: Color(0xff898585),
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: 68,
                        height: 1.5,
                        color: const Color(0xff898585),
                        margin: const EdgeInsets.only(top: 3.0),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        '비밀번호 찾기',
                        style: TextStyle(
                          color: Color(0xff898585),
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 1.5,
                        color: const Color(0xff898585),
                        margin: const EdgeInsets.only(top: 3.0),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return RegisterScreen();
                        },
                      ));
                    },
                    child: Column(
                      children: [
                        const Text(
                          '회원가입 하기',
                          style: TextStyle(
                            color: Color(0xff3AD277),
                            fontFamily: 'Noto_Sans_KR',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 1.5,
                          color: const Color(0xff3AD277),
                          margin: const EdgeInsets.only(top: 3.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 265.0,
              ),
              GestureDetector(
                onTap: () {
                  // 로그인 logic
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
                      '로그인',
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
