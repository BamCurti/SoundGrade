import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soundgrade/services/firebase/firebase_service.dart';
import 'package:soundgrade/services/firebase/artists.dart';
import 'package:soundgrade/data/songs.dart';

class SongCollection extends FirebaseCollection {
  static String get collection {
    return "songs";
  }

  static Future<List<dynamic>> getList() async {
    var data = await FirebaseCollection.getList(collection);
    for (var i = 0; i < data.length; i++) {
      final uuid = await data[i]["artist"].id;
      data[i]["artist"] = await ArtistCollection.getElement(uuid);
    }
    return data;
  }

  static Future<void> saveElement(
      String name, String artistName, String imageUrl) async {
    var artist = await ArtistCollection.getByName(artistName);
    if (artist == null) {
      ArtistCollection.saveElement(artistName);
      artist = await ArtistCollection.getByName(artistName);
    }

    await FirebaseCollection.saveElement(collection, {
      "name": name,
      "artist": artist as DocumentReference,
      "imageUrl": imageUrl,
      "rating": 0,
    });
  }
}
