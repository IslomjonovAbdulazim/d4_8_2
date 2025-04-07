class CommentModel {
  // members
  late int userId;
  late int id;
  late String name;
  late String email;
  late String body;

  // fromJson
  CommentModel.fromJson(Map json) {
    userId = json["userId"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    body = json["body"];
  }
}
