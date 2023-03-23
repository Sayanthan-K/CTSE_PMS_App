import 'dart:convert';

class Admin {
  final String email;
  final String eassword;
  Admin({
    required this.email,
    required this.eassword,
  });

  Admin copyWith({
    String? email,
    String? eassword,
  }) {
    return Admin(
      email: email ?? this.email,
      eassword: eassword ?? this.eassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'eassword': eassword,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      email: map['email'] as String,
      eassword: map['eassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) =>
      Admin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Admin(email: $email, eassword: $eassword)';

  @override
  bool operator ==(covariant Admin other) {
    if (identical(this, other)) return true;

    return other.email == email && other.eassword == eassword;
  }

  @override
  int get hashCode => email.hashCode ^ eassword.hashCode;
}
