// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtusername = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtRePass = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bglog.gif"), fit: BoxFit.cover),
          ),
          child: Container(
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color.fromARGB(208, 255, 255, 255),
                border: Border.all(width: 0.2)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 0.8,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.width / 3.1,
                          child: IconButton(
                            icon: Image.asset(
                              'assets/logo.png',
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const login_screen()));
                            },
                          ),
                        ),
                        const Text(
                          'Đăng ký',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                              controller: txtEmail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.yellow,
                                  )),
                                  border: OutlineInputBorder(),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                              controller: txtusername,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.yellow,
                                  )),
                                  border: OutlineInputBorder(),
                                  hintText: 'Tên Ingame',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                              controller: txtPass,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.yellow,
                                  )),
                                  border: OutlineInputBorder(),
                                  hintText: 'Mật khẩu',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                              controller: txtRePass,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.yellow,
                                  )),
                                  border: OutlineInputBorder(),
                                  hintText: 'Nhập lại mật khẩu',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () async {
                                    if (txtEmail.text.isEmpty ||
                                        txtPass.text.isEmpty ||
                                        txtRePass.text.isEmpty ||
                                        txtusername.text.isEmpty) {
                                      ElegantNotification.error(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              title: const Text("Thông Báo"),
                                              description: const Text(
                                                  "Vui Lòng Nhập Đầy Đủ Thông Tin"))
                                          .show(context);
                                    }
                                    if (txtPass.text != txtRePass.text ||
                                        txtPass.text.isEmpty) {
                                      ElegantNotification.error(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              title: const Text("Thông Báo"),
                                              description: const Text(
                                                  "Vui Lòng Nhập Lại Mật Khẩu"))
                                          .show(context);
                                    } else if (txtPass.text.length < 6) {
                                      ElegantNotification.error(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              title: const Text("Thông Báo"),
                                              description: const Text(
                                                  "Mật Khẩu Ít Nhất 6 Ký Tự"))
                                          .show(context);
                                    } else {
                                      try {
                                        await _auth
                                            .createUserWithEmailAndPassword(
                                                email: txtEmail.text,
                                                password: txtPass.text)
                                            .then((value) {
                                          ElegantNotification.success(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  title:
                                                      const Text("Thông báo"),
                                                  description: const Text(
                                                      "Đăng Ký Thành Công"))
                                              .show(context);
                                          _fireStore
                                              .collection("Users")
                                              .add({
                                                'uid': txtEmail.text,
                                                'DisplayName': txtusername.text,
                                                'Coin': 200,
                                                'Heart': 5,
                                                'RankPoint': 0,
                                                'Avatar': 'user.jpg',
                                                'Bag': {
                                                  '50': 0,
                                                  'double': 0,
                                                  'heart': 0,
                                                  'skip': 0,
                                                },
                                                'Chapters': {
                                                  'First': 0,
                                                  'Second': 0,
                                                  'Third': 0
                                                }
                                              })
                                              .then((value) => Navigator
                                                  .pushReplacementNamed(
                                                      context, 'login'))
                                              .onError((error, stackTrace) {
                                                ElegantNotification.error(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4,
                                                        title: const Text(
                                                            "Thông báo"),
                                                        description: const Text(
                                                            "Có Lỗi Xảy Ra"))
                                                    .show(context);
                                              });
                                        }).onError((error, stackTrace) {
                                          ElegantNotification.error(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  title:
                                                      const Text("Thông báo"),
                                                  description: const Text(
                                                      "Tài Khoản Không Hợp Lệ"))
                                              .show(context);
                                        });
                                      } catch (e) {
                                        ElegantNotification.error(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                title: const Text("Thông báo"),
                                                description:
                                                    const Text("Có Lỗi Xảy Ra"))
                                            .show(context);
                                      }
                                    }
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromARGB(90, 12, 155, 38)),
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.all(20))),
                                  child: const Text(
                                    'Đăng ký',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
