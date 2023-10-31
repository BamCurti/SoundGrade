import 'package:soundgrade/utils/json.dart';

const String songPath = 'assets/dummy/songs.json';

class Song {
  final String rater;
  final String title;
  final String artist;
  final int rating;
  final String imageUrl;

  Song({
    required this.rater,
    required this.title,
    required this.artist,
    required this.rating,
    required this.imageUrl,
  });

  factory Song.fromJson(Map<dynamic, dynamic> json) {
    try {
      return Song(
        rater: json['rater'] as String,
        title: json['title'] as String,
        artist: json['artist'] as String,
        rating: json['rating'] as int,
        imageUrl: json['imageUrl'] as String,
      );
    } catch (e) {
      throw const FormatException();
    }
  }
}

Future<List<Song>> readDummySongs() async {
  final songs = await getDummyData(songPath);
  return songs.map((song) => Song.fromJson(song)).toList();
}
