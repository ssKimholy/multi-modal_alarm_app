import 'package:flutter/material.dart';

class AlarmNameInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) setAlarmName;

  const AlarmNameInput(
      {super.key, required this.controller, required this.setAlarmName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '알람 이름',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Noto_Sans_KR',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: const Color(0xff898585).withOpacity(0.2),
                      style: BorderStyle.solid)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xff898585).withOpacity(0.2),
                  width: 1.0,
                ),
              ),
              hintText: '상대에게 보여줄 알람의 이름을 작성하세요.',
              hintStyle: TextStyle(
                  color: const Color(0xff898585).withOpacity(0.6),
                  fontFamily: 'Noto_Sans_KR',
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
            onSubmitted: (String value) {
              setAlarmName(value);
            },
          ),
        ],
      ),
    );
  }
}
