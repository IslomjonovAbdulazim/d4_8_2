class AlbumsModel {
  // members
  late int userId;
  late int id;
  late String title;

  // fromJson
  AlbumsModel.fromJson(Map json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
  }
}