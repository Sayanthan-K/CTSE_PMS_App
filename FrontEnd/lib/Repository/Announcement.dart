import 'package:araz_mobile_application/Model/Announcement.dart';
import 'package:araz_mobile_application/Model/School.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/School.dart';

class AnnouncementRepository {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('Announcement');

  Stream<List<Announcement>> AllAnnouncement() {
    return _collection.where('schoolid').snapshots().map((snapshot) => snapshot
        .docs
        .map((doc) => Announcement.fromMap(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<void> addAnnouncement(Announcement announcement) async {
    final doc = _collection.doc(announcement.id);
    doc.set(announcement.toMap());
  }

  Future<void> updateAnnouncement(Announcement announcement) async {
    return _collection.doc(announcement.id).update(announcement.toMap());
  }

  Future<void> deleteAnnouncement(Announcement announcement) {
    return _collection.doc(announcement.id).delete();
  }
}
