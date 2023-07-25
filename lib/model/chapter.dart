import 'package:cloud_firestore/cloud_firestore.dart';

class Chapter {
  int id;
  String title;
  int point;
  Chapter({required this.id, required this.title, required this.point});

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Title': title,
      'Point': point,
    };
  }

  Chapter.fromMap(Map<String, dynamic> subjectMap)
      : id = subjectMap["Id"],
        title = subjectMap["Title"],
        point = subjectMap["Point"];

  Chapter.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.data()!["Id"],
        title = doc.data()!["Title"],
        point = doc.data()!["Point"];
}
