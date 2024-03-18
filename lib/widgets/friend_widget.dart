import 'package:alarm_app/models/chat_profile.dart';
import 'package:alarm_app/screens/alarm_setting_screen.dart';
import 'package:flutter/material.dart';

class FriendWidget extends StatefulWidget {
  final ChatProfile chatProfile;
  final Function onUpdateFavorite;

  const FriendWidget(
      {super.key, required this.chatProfile, required this.onUpdateFavorite});

  @override
  State<FriendWidget> createState() => _FriendWidgetState();
}

class _FriendWidgetState extends State<FriendWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 5, 0),
      child: ExpansionTile(
        leading: Image.asset(
          widget.chatProfile.chatImageURL,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          widget.chatProfile.chatName,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Noto_Sans_KR',
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          '${widget.chatProfile.chatNumOfAlarm}개의 알람을 설정해준 친구',
          style: const TextStyle(
              color: Color(0xff898585),
              fontFamily: 'Noto_Sans_KR',
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        trailing: Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 0, 0),
          child: GestureDetector(
            onTap: onTapStar,
            child: Image.asset(
              widget.chatProfile.favorite
                  ? 'assets/images/png/star.png'
                  : 'assets/images/png/hollowStar.png',
              width: 50,
              height: 50,
            ),
          ),
        ),
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 28,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff3AD277),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: GestureDetector(
                onTap: () {
                  // 해당인에게 설정한 알람 보여주는 logic
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '설정한 알람 보기',
                      style: TextStyle(
                          color: Color(0xff3AD277),
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 28,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlarmSettingScreen(
                                    takerName: widget.chatProfile.chatName,
                                  )));
                    },
                    child: Row(
                      children: [
                        const Text(
                          '알람 설정 하기',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Image.asset(
                          'assets/images/png/next.png',
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 30.0,
            ),
          ]),
        ],
      ),
    );
  }

  onTapStar() {
    setState(() {
      widget.chatProfile.like();
    });
    widget.onUpdateFavorite(widget.chatProfile);
  }
}
