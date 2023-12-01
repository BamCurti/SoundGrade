import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soundgrade/services/firebase/firebase_service.dart';

class ArtistCollection extends FirebaseCollection {
  static String get collection {
    return "artists";
  }

  static Future<dynamic> getElement(String uuid) async {
    final data = await FirebaseCollection.getElement(collection, uuid);
    return data;
  }

  static Future<dynamic> getByName(String name) async {
    final snapshot = FirebaseCollection.db
        .collection(collection)
        .where("name", isEqualTo: name);
    final data = await snapshot.get();
    if (data.docs.isEmpty) {
      return;
    }
    return data.docs[0];
  }

  static Future<void> saveElement(String name) async {
    await FirebaseCollection.saveElement(collection, {
      "name": name,
    });
  }
}
