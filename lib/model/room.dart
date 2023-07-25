import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/pop_up/room.dart';

import 'user.dart';

// ignore: empty_constructor_bodies, empty_constructor_bodies
class Room {
  int? id;
  int? star;
  Player? player1;
  Player? player2;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  Room(
      {required this.id,
      required this.star,
      required this.player1,
      required this.player2});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'star': star,
      'player1': player1?.toMap(),
      'player2': player2?.toMap(),
    };
  }

  Room.frommap(Map<String, dynamic> json)
      : id = json['id'],
        star = json['star'],
        player1 = Player.fromMap(json['player1']),
        player2 = Player.fromMap(json['player2']);

  Room.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.data()!["id"],
        star = doc.data()!["star"],
        player1 = doc.data()!["player1"],
        player2 = doc.data()!["player2"];
}
