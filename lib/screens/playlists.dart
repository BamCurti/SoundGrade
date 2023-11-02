import 'package:flutter/material.dart';
import 'package:soundgrade/screens/profile.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/widgets/searchBar.dart';
import 'package:soundgrade/widgets/bottomNav.dart';
import 'package:soundgrade/screens/login.dart';
import 'package:soundgrade/screens/feed.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: mainColor,
        title: CustomSearchBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                PlaylistCard(playlistName: 'Playlist 1'),
                PlaylistCard(playlistName: 'Playlist 2'),
                PlaylistCard(playlistName: 'Playlist 3'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Add your create new list button functionality here
              },
              child: Text('Create New List'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ListPage()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
            default:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
              break;
          }
        },
      ),
    );
  }
}

class PlaylistCard extends StatelessWidget {
  final String playlistName;

  const PlaylistCard({required this.playlistName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple, // Set the background color to purple
        borderRadius:
            BorderRadius.circular(10.0), // Optional: Add rounded corners
      ),
      child: Text(
        playlistName,
        style: TextStyle(fontSize: 24.0, color: Colors.white),
      ),
    );
  }
}
