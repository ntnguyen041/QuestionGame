import 'package:cloud_firestore/cloud_firestore.dart';

class Subject {
  int id;
  String image1;
  String image2;
  String image3;
  int point;
  Subject(
      {required this.id,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.point});

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Image1': image1,
      'Image2': image2,
      'Image3': image3,
      'Point': point,
    };
  }

  Subject.fromMap(Map<String, dynamic> subjectMap)
      : id = subjectMap["Id"],
        image1 = subjectMap["Image1"],
        image2 = subjectMap["Image2"],
        image3 = subjectMap["Image3"],
        point = subjectMap["Point"];

  Subject.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.data()!["Id"],
        image1 = doc.data()!["Image1"],
        image2 = doc.data()!["Image2"],
        image3 = doc.data()!["Image3"],
        point = doc.data()!["Point"];
}
