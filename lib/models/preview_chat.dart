import 'package:alarm_app/models/profile.dart';

class PreviewChat {
  Profile profile;
  String lastChat;
  String transmissionTime;
  bool lastChatChecked;

  PreviewChat({
    required this.profile,
    required this.lastChat,
    required this.transmissionTime,
    required this.lastChatChecked,
  });

  String get getProfileImageURL => profile.imageURL;
  String get getSenderName => profile.name;
  String get getLastChat => lastChat;
  String get getTransmissionTime => transmissionTime;
  bool get getLastChatChecked => lastChatChecked;

  void setLastChatChecked() {
    lastChatChecked = true;
  }
}
