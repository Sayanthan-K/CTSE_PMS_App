import 'package:araz_mobile_application/Model/Marks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/Marks.dart';

class MarksRepository {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('Markss');

  Stream<List<Marks>> AllMarks() {
    return _collection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Marks.fromMap(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<void> addMarks(Marks recipe) async {
    final doc = _collection.doc(recipe.id);
    doc.set(recipe.toMap());
  }

  Future<void> updateMarks(Marks recipe) async {
    return _collection.doc(recipe.id).update(recipe.toMap());
  }

  Future<void> deleteMarks(Marks recipe) {
    return _collection.doc(recipe.id).delete();
  }
}
