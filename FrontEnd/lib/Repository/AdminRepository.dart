import 'package:araz_mobile_application/Model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/Admin.dart';

class AdminRespository {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('Admin');
}
