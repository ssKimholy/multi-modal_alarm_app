import 'package:alarm_app/models/chat_profile.dart';
import 'package:flutter/foundation.dart';

class GlobalVar extends ChangeNotifier {
  int index = 0;
  String deviceToken = '';
  String userName = '';
  String userId = '';
  String userPw = '';
  String userPhoneNumber = '';
  String userAccessToken = '';
  List<ChatProfile> friendsList = [];

  int get getIndex => index;

  String get getDeviceToken => deviceToken;

  String get getUserName => userName;

  String get getUserId => userId;

  String get getUserPw => userPw;

  String get getUserPhoneNumber => userPhoneNumber;

  String get getUserAccessToken => userAccessToken;

  List<ChatProfile> get getFriendsList => friendsList;

  void setIndex(int selectedIndex) {
    index = selectedIndex;
    notifyListeners();
  }

  void setDeviceToken(String token) {
    deviceToken = token;
    notifyListeners();
  }

  void setUserName(String name) {
    userName = name;
    print(userName);
    notifyListeners();
  }

  void setUserId(String id) {
    userId = id;
    notifyListeners();
  }

  void setUserPw(String pw) {
    userPw = pw;
    notifyListeners();
  }

  void setUserPhoneNumber(String phone) {
    userPhoneNumber = phone;
    notifyListeners();
  }

  void setUserAccessToken(String token) {
    userAccessToken = token;
    notifyListeners();
  }

  void addFriendsList(ChatProfile chatProfile) {
    friendsList.add(chatProfile);
  }
}
