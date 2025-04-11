class TodoModel {
  // members
  late int userId;
  late int id;
  late String title;
  late bool completed;

  // fromJson
  TodoModel.fromJson(Map json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    completed = json["completed"];
  }
}
