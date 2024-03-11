import 'package:flutter/material.dart';

import '../models/preview_chat.dart';
import '../models/profile.dart';
import '../utils/date_time_util.dart';
import '../widgets/preview_chat_widget.dart';

class PreviewChatScreen extends StatefulWidget {
  const PreviewChatScreen({super.key});

  @override
  State<PreviewChatScreen> createState() => _PreviewChatScreenState();
}

class _PreviewChatScreenState extends State<PreviewChatScreen> {
  final List<PreviewChat> chatList = [
    PreviewChat(
      profile: Profile('김경영', 'assets/images/png/kimG.png'),
      lastChat: '혈압 높게 나왔어?',
      transmissionTime: DateTimeUtils.convertToChatTime('2024-03-07 19:45:23'),
      lastChatChecked: false,
    ),
    PreviewChat(
      profile: Profile('오은영', 'assets/images/png/ohE.png'),
      lastChat: '오늘 즐거웠어요.',
      transmissionTime: DateTimeUtils.convertToChatTime('2024-03-07 16:32:13'),
      lastChatChecked: false,
    ),
    PreviewChat(
      profile: Profile('이경영', 'assets/images/png/leeG.png'),
      lastChat: '내 승질 까먹은 모양이네?',
      transmissionTime: DateTimeUtils.convertToChatTime('2024-03-07 16:18:55'),
      lastChatChecked: true,
    ),
    PreviewChat(
      profile: Profile('허은아', 'assets/images/png/huhE.png'),
      lastChat: '사진',
      transmissionTime: DateTimeUtils.convertToChatTime('2024-03-07 09:23:12'),
      lastChatChecked: true,
    ),
    PreviewChat(
      profile: Profile('허경영', 'assets/images/png/huhG.png'),
      lastChat: '하하',
      transmissionTime: DateTimeUtils.convertToChatTime('2024-03-04 23:15:52'),
      lastChatChecked: true,
    ),
  ];

  void onClickPreviewChat(PreviewChat previewChat) {
    setState(() {
      previewChat.setLastChatChecked();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        return PreviewChatWidget(
          previewChat: chatList[index],
          onClickPreviewChat: () => onClickPreviewChat(chatList[index]),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 21.0,
        );
      },
    );
  }
}
