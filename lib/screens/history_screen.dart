import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class history_screen extends StatefulWidget {
  const history_screen({super.key});
  @override
  State<history_screen> createState() => _history_screenState();
}

// ignore: camel_case_types
class _history_screenState extends State<history_screen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final pro = FirebaseFirestore.instance
        .collection("history")
        .where('uid', isEqualTo: _auth.currentUser!.email)
        .snapshots();
    bool check(String u) {
      if (u == "thua") {
        return false;
      }
      return true;
    }

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
                          height: MediaQuery.of(context).size.height / 1.48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: const Color.fromARGB(255, 115, 40, 244)
                                  .withOpacity(0.8),
                              border: Border.all(width: 2)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 15),
                                      decoration: BoxDecoration(
                                          //color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: const Text(
                                        "Lịch sử xếp hạng",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
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
                              Expanded(
                                child: ListView.builder(
                                    itemCount: snapshot.data!.docs.length - 1,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                color: check(user[index]
                                                            ['result']
                                                        .toString())
                                                    ? Colors.green.shade600
                                                    : Colors.red.shade500,
                                              ),
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              margin: const EdgeInsets.fromLTRB(
                                                  15, 8, 15, 3),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        user[index]
                                                                ['competitor']
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        "${DateTime.parse(user[index]['time'].toDate().toString())}",
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  )
                                                ],
                                              ),
                                            ),
                                            // history_item(isWin: true),
                                            // history_item(isWin: true),
                                            // history_item(isWin: true),
                                            // history_item(isWin: false),
                                          ],
                                        )),
                              ),
                            ],
                          )),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

// class history_item extends StatelessWidget {
//   const history_item({
//     Key? key,
//     required this.isWin,
//   }) : super(key: key);
//   final bool isWin;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.0),
//         color: isWin ? Colors.green.shade500 : Colors.red.shade500,
//       ),
//       padding: EdgeInsets.all(15.0),
//       margin: EdgeInsets.fromLTRB(15, 8, 15, 3),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Text(
//             isWin ? "Thắng" : "Thua",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Text("AdminABC", style: TextStyle(fontWeight: FontWeight.bold)),
//           Text("30/09/2022", style: TextStyle(fontWeight: FontWeight.bold))
//         ],
//       ),
//     );
//   }
// }
