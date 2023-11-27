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

  static Future<dynamic> getElement(String collection, String uuid) async {
    final doc = await db.collection(collection).doc(uuid).get();
    if (!doc.exists) {
      return;
    }

    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    data["uuid"] = uuid;
    return data;
  }

  static Future<void> saveElement(
      String collection, Map<String, dynamic> data) async {
    await db.collection(collection).add(data);
  }

  static Future<void> updateElement(
      String collection, String uuid, Map<String, dynamic> data) async {
    await db.collection(collection).doc(uuid).set(data);
  }
}
