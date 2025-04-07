import 'package:d4_8_2/models/post_model.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<PostModel> posts = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
