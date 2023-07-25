import 'package:cloud_firestore/cloud_firestore.dart';

class Player {
  String? email;
  String? username;
  int? coin;
  int? point;
  int? heart;
  int? rank;
  String? avatar;
  Player({
    required this.email,
    required this.username,
    this.coin = 1000,
    this.heart = 5,
    this.rank = 0,
    this.avatar = "Default.png",
    this.point = 0,
  });
  Map<String, dynamic> toMap() {
    return {
      'uid': email,
      'DisplayName': username,
      'Coin': coin,
      'Heart': heart,
      'RankPoint': rank,
      'Avatar': avatar,
      'Point': point
    };
  }

  Player.fromMap(Map<String, dynamic> map)
      : email = map["uid"],
        username = map["DisplayName"],
        coin = map["Coin"],
        rank = map["RankPoint"],
        heart = map["Heart"],
        avatar = map["Avatar"],
        point = map["Point"];

  Player.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : email = doc.data()!["uid"],
        username = doc.data()!["DisplayName"],
        coin = doc.data()!["Coin"],
        rank = doc.data()!["RankPoint"],
        heart = doc.data()!["Heart"],
        avatar = doc.data()!["Avatar"],
        point = doc.data()!["Point"];
}
