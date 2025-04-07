class PhotoModel {
  // members
  late int albumId;
  late int id;
  late String title;
  late String url;
  late String thumbnailUrl;

  // fromJson
  PhotoModel.fromJson(Map json) {
    albumId = json["albumId"];
    id = json["id"];
    title = json["title"];
    url = json["url"];
    thumbnailUrl = json["thumbnailUrl"];
  }
}