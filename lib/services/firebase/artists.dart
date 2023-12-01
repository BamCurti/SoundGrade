import 'package:soundgrade/services/firebase/firebase_service.dart';

class ArtistCollection extends FirebaseCollection {
  static String get collection {
    return "artists";
  }

  static Future<dynamic> getElement(String uuid) async {
    final data = await FirebaseCollection.getElement(collection, uuid);
    return data;
  }

  static Future<List<dynamic>> getList() async {
    final data = await FirebaseCollection.getList(collection);
    return data;
  }
}
