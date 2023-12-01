import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soundgrade/services/firebase/firebase_service.dart';
import 'package:soundgrade/data/songs.dart';

class RateCollection extends FirebaseCollection {
  static String get collection {
    return "rates";
  }

  static Future<List<Map>> getList(Song song) async {
    final String songUuid = song.uuid;
    final path = "songs/$songUuid";
    final reference = FirebaseCollection.db
        .collection(collection)
        .where("rateable", isEqualTo: FirebaseCollection.db.doc(path));
    QuerySnapshot querySnapshot = await reference.get();
    return querySnapshot.docs.map((e) {
      Map ref = e.data() as Map;
      ref["uuid"] = e.id;
      ref["rateable"] = song;
      return ref;
    }).toList();
  }
}
