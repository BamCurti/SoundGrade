import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollection {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<dynamic>> getList(String collection) async {
    CollectionReference query = db.collection(collection);
    QuerySnapshot snapshot = await query.get();
    return snapshot.docs.map((e) => e.data()).toList();
  }
}
