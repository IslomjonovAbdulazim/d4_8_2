class CommentModel {
  // members
  late int postId;
  late int id;
  late String name;
  late String email;
  late String body;

  // fromJson
  CommentModel.fromJson(Map json) {
    postId = json["postId"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    body = json["body"];
  }
}
