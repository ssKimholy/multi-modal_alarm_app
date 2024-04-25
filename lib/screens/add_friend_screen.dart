import 'package:alarm_app/models/chat_profile.dart';
import 'package:alarm_app/utils/global_var.dart';
import 'package:alarm_app/utils/http_request_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AddFriendScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  AddFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalVar>(context);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        width: double.infinity,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '추가하고 싶은 친구의 전화번호를 입력하세요.',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Noto_Sans_KR',
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
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
                hintText: '전화번호를 입력하세요.',
                hintStyle: TextStyle(
                    color: const Color(0xff898585).withOpacity(0.6),
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              onSubmitted: (String value) async {
                print(global.getUserId);
                // 친구 추가 api
                Map<String, dynamic> friend =
                    await HttpRequestUtil.setFriend(value, global.getUserId);
                print(friend);
                // global.addFriendsList(ChatProfile(name: name, numOfAlarm: numOfAlarm))
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: const Color(0xff3AD277),
                    ),
                    child: const Text(
                      '완료',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
