import 'package:flutter/material.dart';

import '../models/preview_chat.dart';

class PreviewChatWidget extends StatefulWidget {
  final PreviewChat previewChat;
  final Function onClickPreviewChat;

  const PreviewChatWidget({
    super.key,
    required this.previewChat,
    required this.onClickPreviewChat,
  });

  @override
  State<PreviewChatWidget> createState() => _PreviewChatWidgetState();
}

class _PreviewChatWidgetState extends State<PreviewChatWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClickPreviewChat();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
              child: Image.asset(
                widget.previewChat.getProfileImageURL,
                width: 40,
                height: 40,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.loose,
            child: SizedBox(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.previewChat.getSenderName,
                    style: const TextStyle(
                        fontFamily: 'Noto_Sans_KR',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget.previewChat.getLastChat,
                    style: const TextStyle(
                        fontFamily: 'Noto_Sans_KR',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff898585)),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 20.0, 0),
              width: 82,
              child: Column(
                children: [
                  Text(
                    widget.previewChat.getTransmissionTime,
                    style: TextStyle(
                        fontFamily: 'Noto_Sans_KR',
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff898585).withOpacity(0.75)),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  widget.previewChat.getLastChatChecked
                      ? const SizedBox()
                      : Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: const Color(0xff3AD277).withOpacity(0.7),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50))),
                        )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
