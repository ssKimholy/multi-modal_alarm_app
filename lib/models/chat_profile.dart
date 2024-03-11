class ChatProfile {
  final String name;
  final String imageURL;
  final String numOfAlarm;
  bool favorite;

  ChatProfile({
    required this.name,
    required this.imageURL,
    required this.numOfAlarm,
    this.favorite = false,
  });

  String get chatName => name;
  String get chatImageURL => imageURL;
  String get chatNumOfAlarm => numOfAlarm;

  void like() {
    favorite = !favorite;
  }
}
