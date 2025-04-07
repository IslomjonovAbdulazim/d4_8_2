import 'package:d4_8_2/models/albums_model.dart';
import 'package:d4_8_2/models/comment_model.dart';
import 'package:d4_8_2/models/photo_model.dart';
import 'package:d4_8_2/models/post_model.dart';

class NetworkService {
  static const baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> result = [];

    return result;
  }

  Future<List<CommentModel>> getAllComments() async {
    List<CommentModel> result = [];

    return result;
  }

  Future<List<PhotoModel>> getAllPhotos() async {
    List<PhotoModel> result = [];

    return result;
  }

  Future<List<AlbumsModel>> getAllAlbums() async {
    List<AlbumsModel> result = [];

    return result;
  }
}
