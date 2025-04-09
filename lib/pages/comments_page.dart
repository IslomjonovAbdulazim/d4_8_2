import 'package:d4_8_2/models/comment_model.dart';
import 'package:d4_8_2/service/network_service.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  final int postID;

  const CommentsPage({super.key, required this.postID});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  bool isLoading = false;
  List<CommentModel> comments = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    comments = await NetworkService().getAllComments(widget.postID);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator.adaptive())
            : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final model = comments[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      tileColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
