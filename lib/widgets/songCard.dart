import 'package:flutter/material.dart';
import 'package:soundgrade/screens/dummyData_feed.dart';

class SongCard extends StatelessWidget {
  final String title;
  final String artist;
  final int rating;
  //final String imageUrl;

  const SongCard(
      {required this.title, required this.artist, required this.rating
      //required this.imageUrl,
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //Image.network(imageUrl), // Display the image
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('Artist: $artist'),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text('Rating: $rating'),
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
