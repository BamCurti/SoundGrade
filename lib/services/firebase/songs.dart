import 'package:soundgrade/services/firebase/firebase_service.dart';
import 'package:soundgrade/services/firebase/artists.dart';

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
}
