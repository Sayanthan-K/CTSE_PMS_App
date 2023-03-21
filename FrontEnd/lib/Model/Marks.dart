import 'dart:convert';

class Marks {
  final String id;
  final String first_Name;
  final String last_Name;
  final String maths;
  final String science;
  final String english;

  Marks({
    required this.id,
    required this.first_Name,
    required this.last_Name,
    required this.maths,
    required this.science,
    required this.english,
  });

  Marks copyWith({
    String? id,
    String? first_Name,
    String? last_Name,
    String? maths,
    String? science,
    String? english,
  }) {
    return Marks(
      id: id ?? this.id,
      first_Name: first_Name ?? this.first_Name,
      last_Name: last_Name ?? this.last_Name,
      maths: maths ?? this.maths,
      science: science ?? this.science,
      english: english ?? this.english,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_Name': first_Name,
      'last_Name': last_Name,
      'maths': maths,
      'science': science,
      'english': english,
    };
  }

  factory Marks.fromMap(Map<String, dynamic> map) {
    return Marks(
      id: map['id'] as String,
      first_Name: map['first_Name'] as String,
      last_Name: map['last_Name'] as String,
      maths: map['maths'] as String,
      science: map['science'] as String,
      english: map['english'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Marks.fromJson(String source) =>
      Marks.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Marks(id: $id, first_Name: $first_Name, last_Name: $last_Name, maths: $maths, science: $science, english: $english)';
  }

  @override
  bool operator ==(covariant Marks other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.first_Name == first_Name &&
        other.last_Name == last_Name &&
        other.maths == maths &&
        other.science == science &&
        other.english == english;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        first_Name.hashCode ^
        last_Name.hashCode ^
        maths.hashCode ^
        science.hashCode ^
        english.hashCode;
  }
}
