import 'package:flutter/material.dart';
import 'package:soundgrade/widgets/songCard.dart';

class Song {
  final String title;
  final String artist;
  final int rating;
  //final String imageUrl;

  Song({
    required this.title,
    required this.artist,
    required this.rating,
    //required this.imageUrl,
  });
}

List<Song> dummySongs = [
  Song(title: 'Song Title 1', artist: 'Artist 1', rating: 4
      //imageUrl: 'image1.jpg'
      ),
  // Add more songs as needed
];
