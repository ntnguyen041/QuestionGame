import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  String title;
  List<dynamic> answers;
  int key;
  int point;
  Question({
    required this.title,
    required this.answers,
    required this.key,
    required this.point,
  });

  Map<String, dynamic> toMap() {
    return {
      'Id': title,
      'Answer': answers,
      'Key': key,
      'Point': point,
    };
  }

  Question.fromMap(Map<String, dynamic> questMap)
      : title = questMap["Title"],
        key = questMap["Key"],
        answers = questMap["Answer"],
        point = questMap["Point"];

  Question.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : title = doc.data()!["Title"],
        point = doc.data()!["Point"],
        key = doc.data()!["Key"],
        answers = doc.data()!["Answer"];
}
