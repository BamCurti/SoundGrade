import 'package:soundgrade/utils/json.dart';

const String playlistDummyData = "assets/dummy/playlist.json";

class PlayListData {
  final String name;
  final String id;
  final String imageUrl;
  final List<String> songsId;

  PlayListData(
      {required this.name,
      required this.id,
      required this.imageUrl,
      required this.songsId});

  factory PlayListData.fromJson(Map<String, dynamic> json) {
    try {
      String name = json["name"];
      String id = json["id"];
      String imageUrl = json["imageUrl"];
      final rawSongsId = json['songsId'] as List;
      final songsId = rawSongsId.map((e) => e.toString()).toList();

      return PlayListData(
          name: name, id: id, imageUrl: imageUrl, songsId: songsId);
    } catch (e) {
      throw Error();
    }
  }
}

Future<List<PlayListData>> fetchSongListData() async {
  final data = await getJsonListData(playlistDummyData);
  return data.map((playlist) => PlayListData.fromJson(playlist)).toList();
}
