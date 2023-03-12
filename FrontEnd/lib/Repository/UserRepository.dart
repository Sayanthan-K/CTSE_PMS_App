import 'package:araz_mobile_application/Model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/User.dart';

class UserRepository {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('Users');

  Stream<List<User>> AllUsers() {
    return _collection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => User.fromMap(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<void> addUser(User recipe) async {
    final doc = _collection.doc(recipe.id);
    doc.set(recipe.toMap());
  }

  Future<void> updateUser(User recipe) async {
    return _collection.doc(recipe.id).update(recipe.toMap());
  }

  Future<void> deleteUser(User recipe) {
    return _collection.doc(recipe.id).delete();
  }
}
