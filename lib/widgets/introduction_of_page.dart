import 'package:alarm_app/widgets/intro_button.dart';
import 'package:flutter/material.dart';

class IntroductionOfPage extends StatelessWidget {
  final String introTitle;
  final String introSubTitle;
  final String buttonText;

  const IntroductionOfPage(
      {super.key,
      required this.introTitle,
      required this.introSubTitle,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 35.0, 25.0, 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                introTitle,
                style: const TextStyle(
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                introSubTitle,
                style: const TextStyle(
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff898585)),
              )
            ],
          ),
          IntroButton(buttonText: buttonText)
        ],
      ),
    );
  }
}
