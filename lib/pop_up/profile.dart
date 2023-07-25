import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/history_screen.dart';

// ignore: camel_case_types
class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

// ignore: non_constant_identifier_names
String CheckRank(int p) {
  if (p <= 1) {
    return "Đồng";
  } else if (p <= 50) {
    return "Bạc";
  } else if (p <= 100) {
    return "Vàng";
  } else if (p <= 150) {
    return "Bạch Kim";
  } else if (p > 150) {
    return "Kim Cương";
  }
  return "Không";
}

// ignore: camel_case_types
class _profile_screenState extends State<profile_screen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final pro = FirebaseFirestore.instance
        .collection("Users")
        .where('uid', isEqualTo: _auth.currentUser!.email)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: pro,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final user = snapshot.data!.docs;
          return Scaffold(
            backgroundColor: const Color.fromARGB(0, 255, 193, 7),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        height: MediaQuery.of(context).size.height / 1.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: const Color.fromARGB(0, 149, 117, 205)
                                .withOpacity(0.8),
                            border: Border.all(width: 2)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/img/${user[0]['Avatar']}'),
                                    )),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            user[0]['DisplayName'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Rank: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              CheckRank(user[0]['RankPoint']),
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Image.asset('assets/icons/exit.png'),
                                )
                              ],
                            ),
                            const Text(
                              "Xếp hạng",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/medal.png',
                                      ),
                                      const Text(
                                        "2" "/100",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/trophy.png',
                                      ),
                                      const Text("2" "/100",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Icon(
                                        Icons.diamond,
                                        size: 60,
                                        color: Colors.cyan,
                                      ),
                                      Text("2" "/100",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton.icon(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => const AlertDialog(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          0, 246, 246, 246),
                                                  content: SizedBox(
                                                    height: 280,
                                                    width: 700.0,
                                                    child: history_screen(),
                                                  ),
                                                ));
                                      },
                                      icon: const Icon(Icons.task_alt),
                                      label: const Text("Lịch sử đấu",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold))),
                                  TextButton.icon(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.lock_person_rounded),
                                      label: const Text(
                                        "Đổi mật khẩu",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const CircleAvatar(
                      foregroundColor: Colors.transparent,
                      foregroundImage: AssetImage("assets/img/Default.png"),
                    )),
                Text(
                  "AdminABC",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.yellow.shade600),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image.asset(
                      'assets/icons/coin.png',
                      width: 40,
                      height: 40,
                    )),
                const Text("1000"),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/add.png'),
                  iconSize: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
                const Text("4:02"),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/add.png'),
                  iconSize: 25,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Expanded(
          flex: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/trophy.png'),
                iconSize: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/inventory.png'),
                  iconSize: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/shop.png'),
                iconSize: 40,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/logo.png',
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
