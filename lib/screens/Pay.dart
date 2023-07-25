// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'home.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtusername = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtRePass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                // ignore: prefer_const_literals_to_create_immutables
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
                                      builder: (context) => const login_screen()));
                            },
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (const home())));
                              },
                              child: const SizedBox(
                                width: 50,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/bg.png'),
                                ),
                              ),
                            ),
                            const Text(
                              'Admin',
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          const Text(
                            'Nạp cùng bao đậu',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                              controller: txtEmail,
                              style: const TextStyle(color: Colors.yellow),
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.yellow,
                                  )),
                                  border: OutlineInputBorder(),
                                  hintText: 'Ngân hàng',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                              controller: txtusername,
                              style: const TextStyle(color: Colors.yellow),
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.yellow,
                                  )),
                                  border: OutlineInputBorder(),
                                  hintText: 'Định giá',
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
                                  onPressed: () async {},
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromARGB(90, 12, 155, 38)),
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.all(20))),
                                  child: const Text(
                                    'Nạp',
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
