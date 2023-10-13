import 'package:flutter/material.dart';
import 'package:soundgrade/screens/dummyData_feed.dart';

class SongCard extends StatelessWidget {
  final Song songInfo;

  SongCard({required this.songInfo});

  //final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            songInfo.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
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
    );
  }
}
