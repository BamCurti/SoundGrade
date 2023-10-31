import 'package:flutter/material.dart';
import 'package:soundgrade/screens/post.dart'; // Import your PostPage.dart
import 'package:soundgrade/data/songs.dart';

class SongCard extends StatelessWidget {
  final Song songInfo;

  SongCard({required this.songInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostPage(songInfo: songInfo),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                songInfo.rater,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Image.asset(
              songInfo.imageUrl,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    songInfo.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('Artist: ${songInfo.artist}'),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text('Rating: ${songInfo.rating}'),
                      Icon(Icons.star, color: Colors.yellow, size: 16.0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SongList extends StatelessWidget {
  const SongList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readDummySongs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No data available"),
            );
          } else {
            final data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return SongCard(songInfo: data[index]);
              },
            );
          }
        });
  }
}
