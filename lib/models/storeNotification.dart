class StoreNotification{
  String id;
  String read;
  String createdAt;
  String title;
  String date;
  String body;

  StoreNotification.fromJson(Map json) :
    id = json["id"],
    read = json["read"],
    createdAt = json["createdAt"],
    title = json["title"],
    date = json["date"],
    body = json["body"];
}