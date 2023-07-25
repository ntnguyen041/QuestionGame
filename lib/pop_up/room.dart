import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/screens/multi_play.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/room.dart';

// for the utf8.encode method

// ignore: camel_case_types, must_be_immutable
class room_screen extends StatefulWidget {
  room_screen(
      {super.key,
      required this.roomId,
      required this.player,
      required this.room});
  final int roomId;
  Player player;
  Room room;
  // final String email;
  @override
  State<room_screen> createState() => _room_screenState();
}

// ignore: camel_case_types
class _room_screenState extends State<room_screen> {
  final _fireRoom = FirebaseFirestore.instance;
  // test
  var idRoom = TextEditingController();

  Future joinRoom(String id) async {
    FirebaseFirestore.instance
        .collection('Rooms')
        .doc(id)
        .snapshots()
        .forEach((element) async {
      if (element.data()!['player1']['email'] == null) {
        await _fireRoom.collection("Rooms").doc(id).update({
          'create_at': DateTime.now(),
          'player2.Avatar': widget.player.avatar,
          'player2.DisplayName': widget.player.username,
          'player2.email': widget.player.email,
          'player2.rankpoint': widget.player.rank,
          'player2.Point': 0,
        });
        Future.delayed(
            const Duration(seconds: 1),
            () => _fireRoom
                .collection("Rooms")
                .doc(widget.roomId.toString())
                .delete());
        return;
      }
    });
    await _fireRoom.collection("Rooms").doc(id).update({
      'create_at': DateTime.now(),
      'player2.Avatar': widget.player.avatar,
      'player2.DisplayName': widget.player.username,
      'player2.email': widget.player.email,
      'player2.RankPoint': widget.player.rank,
      'player2.Point': 0,
    }).then((value) =>
        _fireRoom.collection("Rooms").doc(widget.roomId.toString()).delete());
  }

  @override
  Widget build(BuildContext context) {
    // LAY THONG TIN NGUOI CHOI 2
    final auth = FirebaseAuth.instance;
    var collection = FirebaseFirestore.instance.collection('Rooms');
    return StreamBuilder(
      stream: collection.doc(widget.roomId.toString()).snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Center(child: CircularProgressIndicator());
        }
        Map<String, dynamic> room =
            snapshot.data!.data() as Map<String, dynamic>;

        if (room['star'] == 1) {
          widget.room.id = widget.roomId;
          widget.room.star = room['star'];
          widget.room.player1?.avatar = room['player1']['Avatar'];
          widget.room.player1?.username = room['player1']['DisplayName'];
          widget.room.player1?.point = room['player1']['Point'];
          widget.room.player1?.rank = room['player1']['RankPoint'];
          widget.room.player1?.email = room['player1']['email'];
          widget.room.player2?.avatar = room['player2']['Avatar'];
          widget.room.player2?.username = room['player2']['DisplayName'];
          widget.room.player2?.point = room['player2']['Point'];
          widget.room.player2?.rank = room['player2']['RankPoint'];
          widget.room.player2?.email = room['player2']['email'];

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => multi_play(
                    player: widget.player,
                    room: widget.room,
                  ),
                ));
          });
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromARGB(0, 255, 193, 7),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width / 1.7,
                        height: MediaQuery.of(context).size.height / 1.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: const Color.fromARGB(156, 242, 247, 244)
                                .withOpacity(0.8),
                            border: Border.all(width: 2)),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                              height: MediaQuery.of(context).size.height / 8.5,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text('ID',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.5, color: Colors.black),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${room['id']}'),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: TextField(
                                          controller: idRoom,
                                          decoration: const InputDecoration(
                                            hintText: 'ID',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            prefixIcon: Icon(Icons.search),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(20, 40),
                                      ),
                                      onPressed: () async {
                                        String id = idRoom.text;
                                        if (id.isEmpty) {
                                          ElegantNotification.error(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  title:
                                                      const Text("Thông báo"),
                                                  description: const Text(
                                                      "Vui Lòng Nhập Đủ Thông Tin"))
                                              .show(context);
                                          return;
                                        }
                                        if (id == room['id'].toString()) {
                                          ElegantNotification.info(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  title:
                                                      const Text("Thông báo"),
                                                  description: const Text(
                                                      "Bạn Đang Ở Trong Phòng"))
                                              .show(context);
                                          return;
                                        }
                                        FirebaseFirestore.instance
                                            .collection('Rooms')
                                            .doc(id)
                                            .snapshots()
                                            .forEach((element) {
                                          if (element.data()!['player2']
                                                  ['email'] !=
                                              null) {
                                            ElegantNotification.info(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    title:
                                                        const Text("Thông báo"),
                                                    description: const Text(
                                                        "Phòng Đã Đủ Người"))
                                                .show(context);
                                            return;
                                          }
                                          if (element.data()!['player1']
                                                  ['email'] ==
                                              widget.player.email) {
                                            ElegantNotification.info(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    title:
                                                        const Text("Thông báo"),
                                                    description: const Text(
                                                        "Bạn Đang Trong Phòng"))
                                                .show(context);
                                            return;
                                          }
                                        });
                                        await joinRoom(id).then(
                                          (value) {
                                            Navigator.pop(context);
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        0, 246, 246, 246),
                                                content: SizedBox(
                                                  height: 280,
                                                  width: 580.0,
                                                  child: room_screen(
                                                    roomId: int.parse(id),
                                                    player: widget.player,
                                                    room: widget.room,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: const Text(
                                        'Ok',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        if (room['player1']['email'] ==
                                                widget.player.email &&
                                            room['player2']['email'] == null) {
                                          _fireRoom
                                              .collection("Rooms")
                                              .doc(widget.roomId.toString())
                                              .delete();
                                        } else if (room['player2']['email'] ==
                                            widget.player.email) {
                                          _fireRoom
                                              .collection("Rooms")
                                              .doc(widget.roomId.toString())
                                              .update({
                                            'create_at': DateTime.now(),
                                            'player1.Avatar': room['player2']
                                                ['Avatar'],
                                            'player1.DisplayName':
                                                room['player2']['DisplayName'],
                                            'player1.email': room['player2']
                                                ['email'],
                                            'player1.RankPoint': room['player2']
                                                ['RankPoint'],
                                            'player2.Avatar': null,
                                            'player2.DisplayName': null,
                                            'player2.email': null,
                                            'player2.RankPoint': 0,
                                            'player2.Point': 0,
                                          });
                                        }
                                        Navigator.pushNamedAndRemoveUntil(
                                            context, 'home', (route) => false);
                                        return;
                                      },
                                      icon:
                                          Image.asset('assets/icons/exit.png'),
                                    )
                                  ]),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          30, 2, 0, 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 0.5, color: Colors.black),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color.fromARGB(
                                                    255, 12, 12, 12)
                                                .withOpacity(0.5),

                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: User(user: room['player1']),
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.asset(
                                      "assets/icons/vs.png",
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 2, 0, 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 0.5, color: Colors.black),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                      255, 12, 12, 12)
                                                  .withOpacity(0.5),

                                              blurRadius: 7,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: room['player2']['email'] == null
                                          ? Image.asset(
                                              'assets/Loading_2.gif',
                                            )
                                          : User(user: room['player2']),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (room['player1']['email'] !=
                                    widget.player.email) {
                                  ElegantNotification.info(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          title: const Text("Thông báo"),
                                          description: const Text(
                                              "Chờ Chủ Phòng Bắt Đầu"))
                                      .show(context);
                                  return;
                                }
                                if (room['player2']['email'] == null) {
                                  ElegantNotification.info(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          title: const Text("Thông báo"),
                                          description: const Text(
                                              "Chờ Người Chơi Còn Lại"))
                                      .show(context);
                                  return;
                                }
                                if (room['player1']['email'] ==
                                        auth.currentUser!.email &&
                                    room['player2']['email'] != null) {
                                  _fireRoom
                                      .collection("Rooms")
                                      .doc(widget.roomId.toString())
                                      .update({
                                    'create_at': DateTime.now(),
                                    'star': 1,
                                  });
                                }
                                return;
                              },
                              child: room['player1']['email'] ==
                                          auth.currentUser!.email &&
                                      room['player2']['email'] != null
                                  ? const Text(
                                      'Bắt đầu',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  : const Text(
                                      'Đợi đối thủ bắt đầu',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.amber),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// ignore: non_constant_identifier_names
String CheckRank(int p) {
  if (p <= 0) {
    return "Không";
  } else if (p <= 50) {
    return "Bạc";
  } else if (p <= 100) {
    return "Vàng";
  } else if (p <= 150) {
    return "Bạch Kim";
  }
  return "kim cương";
}

class User extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final user;
  const User({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    var p = user['RankPoint'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15,
                    offset: Offset(-5, 5),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/img/${user['Avatar']}'),
              ),
            ),
          ),
        ),
        Text(
          '${user['DisplayName']}',
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Text('ID:${user['email']}'),
        ),
        Text('Rank: ${CheckRank(p)}'),
      ],
    );
  }
}
