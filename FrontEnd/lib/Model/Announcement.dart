import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Announcement {
  final String id;
  final String schoolid;
  final String title;
  final String message;
  final String date;
  Announcement({
    required this.id,
    required this.schoolid,
    required this.title,
    required this.message,
    required this.date,
  });

  Announcement copyWith({
    String? id,
    String? schoolid,
    String? title,
    String? message,
    String? date,
  }) {
    return Announcement(
      id: id ?? this.id,
      schoolid: schoolid ?? this.schoolid,
      title: title ?? this.title,
      message: message ?? this.message,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'schoolid': schoolid,
      'title': title,
      'message': message,
      'date': date,
    };
  }

  factory Announcement.fromMap(Map<String, dynamic> map) {
    return Announcement(
      id: map['id'] as String,
      schoolid: map['schoolid'] as String,
      title: map['title'] as String,
      message: map['message'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Announcement.fromJson(String source) =>
      Announcement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Announcement(id: $id, schoolid: $schoolid, title: $title, message: $message, date: $date)';
  }

  @override
  bool operator ==(covariant Announcement other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.schoolid == schoolid &&
        other.title == title &&
        other.message == message &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        schoolid.hashCode ^
        title.hashCode ^
        message.hashCode ^
        date.hashCode;
  }
}
