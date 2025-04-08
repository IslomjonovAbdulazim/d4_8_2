import 'package:d4_8_2/pages/albums_page.dart';
import 'package:d4_8_2/pages/photos_page.dart';
import 'package:d4_8_2/pages/posts_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  final pages = [
    PostsPage(),
    PhotosPage(),
    AlbumsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      // continue
      // bottomNavigationBar: ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          currentPage = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Posts"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: "Photos"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            label: "Albums"
          ),
        ],
      ),
    );
  }
}
