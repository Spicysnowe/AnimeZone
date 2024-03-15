import 'package:anime_zone/network/abstract/base_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService extends BaseFireStoreService {
  final _firestoreInstance = FirebaseFirestore.instance;
  @override
  Future addDataToFirestore(
      Map<String, dynamic> data, String collectionName, String docName) async {
    try {
      await _firestoreInstance
          .collection(collectionName)
          .doc(docName)
          .set(data);
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  @override
  Future updateDataToFirestore(
      Map<String, dynamic> data, String collectionName, String docName) async {
    try {
      await _firestoreInstance
          .collection(collectionName)
          .doc(docName)
          .update(data);
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  @override
  Future getUserDataFromFirestore(String collectionName, String docName) async {
    try {
      final userData = await _firestoreInstance
          .collection(collectionName)
          .doc(docName)
          .get();
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
}
