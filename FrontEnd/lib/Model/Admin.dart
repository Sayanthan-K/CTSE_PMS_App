// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Admin {
  final String adminID;
  final String email;
  final String eassword;
  Admin({
    required this.adminID,
    required this.email,
    required this.eassword,
  });

  Admin copyWith({
    String? adminID,
    String? email,
    String? eassword,
  }) {
    return Admin(
      adminID: adminID ?? this.adminID,
      email: email ?? this.email,
      eassword: eassword ?? this.eassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adminID': adminID,
      'email': email,
      'eassword': eassword,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      adminID: map['adminID'] as String,
      email: map['email'] as String,
      eassword: map['eassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) =>
      Admin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Admin(adminID: $adminID, email: $email, eassword: $eassword)';

  @override
  bool operator ==(covariant Admin other) {
    if (identical(this, other)) return true;

    return other.adminID == adminID &&
        other.email == email &&
        other.eassword == eassword;
  }

  @override
  int get hashCode => adminID.hashCode ^ email.hashCode ^ eassword.hashCode;
}
