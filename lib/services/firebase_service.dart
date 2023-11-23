import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollection {
  static FirebaseFirestore db = FirebaseFirestore.instance;

  static Future<List<dynamic>> getList(String collection) async {
    CollectionReference query = db.collection(collection);
    QuerySnapshot snapshot = await query.get();
    return snapshot.docs.map((e) {
      Map ref = e.data() as Map;
      ref["uuid"] = e.id;
      return ref;
    }).toList();
  }
}
