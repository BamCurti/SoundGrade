import 'package:soundgrade/data/rateable.dart';
import 'package:soundgrade/utils/json.dart';
import 'package:soundgrade/services/firebase_service.dart';

const String songPath = 'assets/dummy/songs.json';

const String songCollection = "songs";

class Song extends FirebaseCollection {
  static String collection = "songs";
  String name;
  String artist;
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
      String artist = json["artist"] as String;
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
      throw const FormatException();
    }
    return song;
  }
}

Future<List<Song>> readDummySongs() async {
  final songs = await getJsonListData(songPath);
  return songs.map((song) => Song.fromJson(song)).toList();
}
