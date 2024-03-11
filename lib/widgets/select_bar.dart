import 'package:flutter/material.dart';

class SelectBar extends StatefulWidget {
  bool isChatPage;
  final Function onChangeChatScreen;
  final Function onChangeAlarmLogScreen;

  SelectBar(
      {super.key,
      required this.isChatPage,
      required this.onChangeChatScreen,
      required this.onChangeAlarmLogScreen});

  @override
  State<SelectBar> createState() => _SelectBarState();
}

class _SelectBarState extends State<SelectBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              onChangeToChatPage();
            },
            child: Column(
              children: [
                Text(
                  '채팅',
                  style: TextStyle(
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: widget.isChatPage
                          ? Colors.black.withOpacity(0.7)
                          : const Color(0xff898585).withOpacity(0.7)),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: 67,
                  height: 1.5,
                  color: widget.isChatPage
                      ? Colors.black.withOpacity(0.6)
                      : const Color(0xff898585).withOpacity(0.2),
                )
              ],
            )),
        InkWell(
            onTap: () {
              onChangeToAlarmLogPage();
            },
            child: Column(
              children: [
                Text(
                  '알람 기록',
                  style: TextStyle(
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: widget.isChatPage
                          ? const Color(0xff898585).withOpacity(0.7)
                          : Colors.black.withOpacity(0.7)),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: 94,
                  height: 1.5,
                  color: widget.isChatPage
                      ? const Color(0xff898585).withOpacity(0.2)
                      : Colors.black.withOpacity(0.6),
                )
              ],
            )),
        Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 161,
              height: 2,
              color: const Color(0xff898585).withOpacity(0.2),
            )
          ],
        )
      ],
    );
  }

  onChangeToChatPage() {
    setState(() {
      widget.isChatPage = true;
    });
    widget.onChangeChatScreen();
  }

  onChangeToAlarmLogPage() {
    setState(() {
      widget.isChatPage = false;
    });
    widget.onChangeAlarmLogScreen();
  }
}
