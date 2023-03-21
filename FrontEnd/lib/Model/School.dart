import 'dart:convert';

class School {
  final String id;
  final String name;
  final String email;
  final String mobile_number;
  final String address;

  School({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile_number,
    required this.address,
  });

  School copyWith({
    String? id,
    String? name,
    String? email,
    String? mobile_number,
    String? address,
  }) {
    return School(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile_number: mobile_number ?? this.mobile_number,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'usertype': name,
      'email': email,
      'mobile_number': mobile_number,
      'address': address,
    };
  }

  factory School.fromMap(Map<String, dynamic> map) {
    return School(
      id: map['id'] as String,
      name: map['usertype'] as String,
      email: map['email'] as String,
      mobile_number: map['mobile_number'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory School.fromJson(String source) =>
      School.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, usertype: $name, email: $email, mobile_number: $mobile_number, address: $address)';
  }

  @override
  bool operator ==(covariant School other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.mobile_number == mobile_number &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        mobile_number.hashCode ^
        address.hashCode;
  }
}
