import 'package:araz_mobile_application/Model/School.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/School.dart';

class UserRepository {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('Schools');

  Stream<List<School>> AllSchools() {
    return _collection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => School.fromMap(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<void> addSchool(School recipe) async {
    final doc = _collection.doc(recipe.id);
    doc.set(recipe.toMap());
  }

  Future<void> updateSchool(School recipe) async {
    return _collection.doc(recipe.id).update(recipe.toMap());
  }

  Future<void> deleteSchool(School recipe) {
    return _collection.doc(recipe.id).delete();
  }
}
