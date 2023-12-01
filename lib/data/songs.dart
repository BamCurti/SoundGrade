import 'package:soundgrade/data/artist.dart';
import 'package:soundgrade/data/rateable.dart';

const String songCollection = "songs";

class Song {
  String name;
  Artist artist;
  int rating;
  String imageUrl;
  String uuid;
  List<Rate>? rates;

  Song({
    required this.name,
    required this.artist,
    this.rating = 0,
    required this.imageUrl,
    required this.uuid,
  });

  factory Song.fromJson(Map<dynamic, dynamic> json) {
    Song? song;
    try {
      String name = json["name"] as String;
      final rawArtist = json["artist"];
      Artist artist = Artist.fromJson(rawArtist);
      int rating = json["rating"] ?? 0;
      String imageUrl = json["imageUrl"] as String;
      String uuid = json["uuid"] as String;

      song = Song(
          name: name,
          artist: artist,
          rating: rating,
          imageUrl: imageUrl,
          uuid: uuid);
    } catch (e) {
      print(e);
      throw const FormatException();
    }
    return song;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "artist": artist.toJson(),
      "rating": rating,
      "imageUrl": imageUrl
    };
  }
}
