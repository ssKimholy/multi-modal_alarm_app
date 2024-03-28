import 'package:alarm_app/models/chat_profile.dart';
import 'package:alarm_app/widgets/custom_app_bar.dart';
import 'package:alarm_app/widgets/custom_bottom_bar.dart';
import 'package:alarm_app/widgets/friend_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/introduction_of_page.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  List<ChatProfile> chatProfiles = [
    ChatProfile(
        name: '김경영', imageURL: 'assets/images/png/kimG.png', numOfAlarm: '4'),
    ChatProfile(
        name: '김진구', imageURL: 'assets/images/png/kimR.png', numOfAlarm: '0'),
    ChatProfile(
        name: '오은영', imageURL: 'assets/images/png/ohE.png', numOfAlarm: '1'),
    ChatProfile(
        name: '이개명', imageURL: 'assets/images/png/kimR.png', numOfAlarm: '1'),
    ChatProfile(
        name: '이경영', imageURL: 'assets/images/png/leeG.png', numOfAlarm: '2'),
    ChatProfile(
        name: '허은아', imageURL: 'assets/images/png/huhE.png', numOfAlarm: '4'),
    ChatProfile(
        name: '허경영', imageURL: 'assets/images/png/huhG.png', numOfAlarm: '3'),
  ];

  List<ChatProfile> favoriteChatProfiles = [];

  void updateFavoriteUI(ChatProfile profile) {
    // 즐겨찾기 여부
    setState(() {
      if (profile.favorite) {
        favoriteChatProfiles.add(profile);
      } else {
        favoriteChatProfiles.remove(profile);
      }
      favoriteChatProfiles.sort((a, b) => a.name.compareTo(b.name)); // 가나다 순 정렬
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '친구 목록',
        marginVar: 58.0,
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: Column(
        children: [
          const IntroductionOfPage(
            introTitle: '친구에게 알람 설정',
            introSubTitle: '알람을 맞춰주고 싶은 친구를 선택해 추가하세요.',
            buttonText: '친구 추가',
          ),
          Expanded(
            child: ListView(
              children: [
                // favoriteChatProfiles 리스트가 비어 있지 않으면 리스트 뷰를 표시하고, 그렇지 않으면 텍스트를 표시
                favoriteChatProfiles.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true, // 내부 ListView이므로, 이 옵션을 true로 설정
                        physics:
                            const NeverScrollableScrollPhysics(), // 내부 스크롤을 비활성화
                        itemCount: favoriteChatProfiles.length,
                        itemBuilder: (context, index) {
                          return FriendWidget(
                            chatProfile: favoriteChatProfiles[index],
                            onUpdateFavorite: updateFavoriteUI,
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          color: const Color(0xff90B483).withOpacity(0.25),
                          thickness: 1.0,
                          indent: 3.0,
                          endIndent: 3.0,
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                            child: Text(
                          '즐겨찾기에 추가된 친구가 없습니다.',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff898585)),
                        )),
                      ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 15.0, 0, 10.0),
                  child: Row(
                    children: [
                      Image.asset('assets/images/png/friends.png'),
                      const SizedBox(width: 5.0),
                      const Text(
                        '전체 친구',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                // 전체 친구 목록 표시
                ListView.separated(
                  shrinkWrap: true, // 내부 ListView이므로, 이 옵션을 true로 설정
                  physics: const NeverScrollableScrollPhysics(), // 내부 스크롤을 비활성화
                  itemCount: chatProfiles.length,
                  itemBuilder: (context, index) {
                    return FriendWidget(
                      chatProfile: chatProfiles[index],
                      onUpdateFavorite: updateFavoriteUI,
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: const Color(0xff90B483).withOpacity(0.25),
                    thickness: 1.0,
                    indent: 3.0,
                    endIndent: 3.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
