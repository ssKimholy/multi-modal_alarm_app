import 'package:alarm_app/models/chat_profile.dart';
import 'package:alarm_app/screens/alarm_setting_screen.dart';
import 'package:alarm_app/screens/friend_alarm_page.dart';
import 'package:alarm_app/utils/global_var.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/profile_button.svg',
                      width: 45,
                      height: 45,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.chatProfile.chatName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
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
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 130,
                  height: 40,
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
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return FriendAlarmPage(
                            id: widget.chatProfile.getId,
                            name: widget.chatProfile.chatName,
                          );
                        },
                      ));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '설정한 알람',
                          style: TextStyle(
                              color: Color(0xff3AD277),
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 15,
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
                  width: 130,
                  height: 40,
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
                                        takerId: widget.chatProfile.getId,
                                      )));
                        },
                        child: Row(
                          children: [
                            const Text(
                              '알람 설정',
                              style: TextStyle(
                                  fontFamily: 'Noto_Sans_KR',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Image.asset(
                              'assets/images/png/next.png',
                              width: 25,
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  onTapStar() {
    setState(() {
      widget.chatProfile.like();
    });
    widget.onUpdateFavorite(widget.chatProfile);
  }
}
