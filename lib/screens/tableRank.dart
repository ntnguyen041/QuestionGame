import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';

import 'package:flutter_application_1/screens/proCompetitor.dart';

class TableRank extends StatefulWidget {
  const TableRank({super.key});

  @override
  State<TableRank> createState() => _TableRankState();
}

class _TableRankState extends State<TableRank> {
  final _auth = FirebaseAuth.instance;
  final pro = FirebaseFirestore.instance
      .collection("Users")
      .orderBy("RankPoint", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 255, 193, 7),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    height: MediaQuery.of(context).size.height / 1.48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color:
                            Color.fromARGB(230, 233, 233, 233).withOpacity(0.8),
                        border: Border.all(width: 2)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  decoration: BoxDecoration(
                                      //color: Colors.blue,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: const Text(
                                    "Bảng Xếp Hạng Máy Chủ Việt Nam",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Image.asset('assets/icons/exit.png'),
                              iconSize: 30,
                            )
                          ],
                        ),
                        StreamBuilder(
                          stream: pro,
                          builder: (BuildContext context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            //List user = snapshot.data!.docs;
                            List<Player> users = snapshot.data!.docs
                                .map((e) => Player.fromDocumentSnapshot(e))
                                .toList();

                            return Container(
                              height: 200,
                              child: ListView.builder(
                                itemCount: users.length,
                                itemBuilder: (context, index) {
                                  CheckRank(
                                      int.parse(users[index].rank.toString()));

                                  return GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                backgroundColor: Color.fromARGB(
                                                    0, 246, 246, 246),
                                                content: SizedBox(
                                                  height: 200,
                                                  width: 550.0,
                                                  child: profile_com(
                                                    user: users[index],
                                                    top: index + 1,
                                                  ),
                                                ),
                                              ));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Expanded(
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    blurRadius: 4,
                                                    offset: Offset(4,
                                                        8), // Shadow position
                                                  ),
                                                ],
                                                color: checktop(int.parse(
                                                    users[index]
                                                        .rank
                                                        .toString())),
                                                border: Border.all(
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: CircleAvatar(
                                                        backgroundImage: AssetImage(
                                                            'assets/img/${users[index].avatar}'),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 120,
                                                      child: Center(
                                                        child: Text(
                                                          users[index]
                                                              .username
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                      child: Center(
                                                        child: Text(
                                                          CheckRank(int.parse(
                                                              users[index]
                                                                  .rank
                                                                  .toString())),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    (index + 1).toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

String CheckRank(int p) {
  if (p <= 1)
    return "Đồng Đoàn";
  else if (p <= 50)
    return "Bạc Rách";
  else if (p <= 100)
    return "Vàng nước";
  else if (p <= 150)
    return "Bạch Kim";
  else if (p <= 1000)
    return "Kim Cương";
  else if (p > 1000) return "Đại Cao thủ";
  return "Không";
}

Color checktop(int p) {
  Color colorb = Colors.white;
  if (p <= 1) {
    colorb = Color.fromARGB(176, 255, 255, 255);
  } else if (p <= 50)
    colorb = Color.fromARGB(185, 164, 238, 248);
  else if (p <= 100)
    colorb = Color.fromARGB(197, 212, 243, 76);
  else if (p <= 150)
    colorb = Color.fromARGB(174, 149, 138, 248);
  else if (p <= 1000)
    colorb = Color.fromARGB(209, 248, 66, 66);
  else if (p > 1000) colorb = Color.fromARGB(199, 250, 3, 3);
  return colorb;
}
