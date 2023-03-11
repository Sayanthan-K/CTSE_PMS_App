import 'dart:convert';

class User {
  final String id;
  final String usertype;
  final String first_Name;
  final String last_Name;
  final String email;
  final String mobile_number;
  final String age;
  final String address;

  User({
    required this.id,
    required this.usertype,
    required this.first_Name,
    required this.last_Name,
    required this.email,
    required this.mobile_number,
    required this.age,
    required this.address,
  });

  User copyWith({
    String? id,
    String? usertype,
    String? first_Name,
    String? last_Name,
    String? email,
    String? mobile_number,
    String? age,
    String? address,
  }) {
    return User(
      id: id ?? this.id,
      usertype: usertype ?? this.usertype,
      first_Name: first_Name ?? this.first_Name,
      last_Name: last_Name ?? this.last_Name,
      email: email ?? this.email,
      mobile_number: mobile_number ?? this.mobile_number,
      age: age ?? this.age,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'usertype': usertype,
      'first_Name': first_Name,
      'last_Name': last_Name,
      'email': email,
      'mobile_number': mobile_number,
      'age': age,
      'address': address,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      usertype: map['usertype'] as String,
      first_Name: map['first_Name'] as String,
      last_Name: map['last_Name'] as String,
      email: map['email'] as String,
      mobile_number: map['mobile_number'] as String,
      age: map['age'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, usertype: $usertype, first_Name: $first_Name, last_Name: $last_Name, email: $email, mobile_number: $mobile_number, age: $age, address: $address)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.usertype == usertype &&
        other.first_Name == first_Name &&
        other.last_Name == last_Name &&
        other.email == email &&
        other.mobile_number == mobile_number &&
        other.age == age &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        usertype.hashCode ^
        first_Name.hashCode ^
        last_Name.hashCode ^
        email.hashCode ^
        mobile_number.hashCode ^
        age.hashCode ^
        address.hashCode;
  }
}
