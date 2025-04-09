import '../models/photo_model.dart';
import '../service/network_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  List<PhotoModel> photos = [];
  bool isLoading = false;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    photos = await NetworkService().getAllPhotos();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
      ),
      body: isLoading
          ? Center(child: CupertinoActivityIndicator())
          : ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final model = photos[index];
                return Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Album ID: ${model.albumId}, Photo ID: ${model.id}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "\nTitle",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        model.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          height: 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
