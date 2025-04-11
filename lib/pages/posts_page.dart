import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';
import '../service/network_service.dart';
import 'comments_page.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<PostModel> posts = [];
  bool isLoading = false;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    posts = await NetworkService().getAllPosts();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator.adaptive())
            : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final model = posts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      color: Colors.indigo,
                      onPressed: () {
                        Get.to(CommentsPage(postID: model.id));
                      },
                      child: ListTile(
                        title: Text(
                          model.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          model.body,
                          style: TextStyle(
                            color: Colors.white,
                            height: 1,
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
