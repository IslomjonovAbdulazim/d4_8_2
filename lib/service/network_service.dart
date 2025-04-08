import 'dart:convert';

import 'package:d4_8_2/models/albums_model.dart';
import 'package:d4_8_2/models/comment_model.dart';
import 'package:d4_8_2/models/photo_model.dart';
import 'package:d4_8_2/models/post_model.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  static const baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> result = [];
    Uri uri = Uri.parse("$baseUrl/posts");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List jsonList = List.from(jsonDecode(response.body));
      result = jsonList.map((json) => PostModel.fromJson(json)).toList();
    }

    return result;
  }

  Future<List<CommentModel>> getAllComments(int postId) async {
    List<CommentModel> result = [];
    Uri uri = Uri.parse("$baseUrl/comments");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List jsonList = List.from(jsonDecode(response.body));
      result = jsonList.map((json) => CommentModel.fromJson(json)).toList();
      result.removeWhere((model) => model.postId != postId);
    }

    return result;
  }

  Future<List<PhotoModel>> getAllPhotos() async {
    List<PhotoModel> result = [];
    Uri uri = Uri.parse("$baseUrl/photos");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List jsonList = List.from(jsonDecode(response.body));
      result = jsonList.map((json) => PhotoModel.fromJson(json)).toList();
    }

    return result;
  }

  Future<List<AlbumsModel>> getAllAlbums() async {
    List<AlbumsModel> result = [];
    Uri uri = Uri.parse("$baseUrl/albums");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List jsonList = List.from(jsonDecode(response.body));
      result = jsonList.map((json) => AlbumsModel.fromJson(json)).toList();
    }
    return result;
  }
}
