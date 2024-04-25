class ChatProfile {
  final String name;
  final String id;
  final int num;
  // final String imageURL;
  final String numOfAlarm;
  bool favorite;

  ChatProfile({
    required this.name,
    // required this.imageURL,
    required this.id,
    required this.num,
    required this.numOfAlarm,
    this.favorite = false,
  });

  String get chatName => name;
  String get getId => id;
  // String get chatImageURL => imageURL;
  String get chatNumOfAlarm => numOfAlarm;

  void like() {
    favorite = !favorite;
  }
}
