import 'package:d4_8_2/models/albums_model.dart';
import 'package:d4_8_2/service/network_service.dart';
import 'package:flutter/material.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  bool isLoading = false;
  List<AlbumsModel> albums = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    albums = await NetworkService().getAllAlbums();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator.adaptive())
            : ListView.builder(
                itemCount: albums.length,
                itemBuilder: (context, index) {
                  final model = albums[index];
                  return ListTile(
                    title: Text(model.title),
                    subtitle: Text("ID: ${model.id}, User Id: ${model.userId}"),
                  );
                },
              ),
      ),
    );
  }
}
