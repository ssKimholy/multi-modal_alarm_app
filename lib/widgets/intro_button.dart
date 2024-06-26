import 'package:alarm_app/screens/add_friend_screen.dart';
import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  final String buttonText;

  const IntroButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5.0, 10.0, 0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xff3AD277)),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0))),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddFriendScreen();
            },
          ));
        },
        child: Text(
          buttonText,
          style: const TextStyle(
              fontFamily: 'Noto_Sans_KR',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
    );
  }
}
