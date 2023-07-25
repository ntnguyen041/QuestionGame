// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'login.dart';

class UpdatePasss extends StatelessWidget {
  const UpdatePasss({super.key});

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
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height:
                                      MediaQuery.of(context).size.width / 3.1,
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
                                  'Đổi mật khẩu',
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
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: TextField(
                                      style: TextStyle(color: Colors.yellow),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.yellow,
                                          )),
                                          border: OutlineInputBorder(),
                                          hintText: 'Mật khẩu cũ',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: TextField(
                                      style: TextStyle(color: Colors.yellow),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.yellow,
                                          )),
                                          border: OutlineInputBorder(),
                                          hintText: 'Mât khẩu mới',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: TextField(
                                      style: TextStyle(color: Colors.yellow),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.yellow,
                                          )),
                                          border: OutlineInputBorder(),
                                          hintText: 'Nhập lại mât khẩu mới',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () => {},
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Color.fromARGB(
                                                          90, 12, 155, 38)),
                                              padding: MaterialStatePropertyAll(
                                                  EdgeInsets.all(20))),
                                          child: const Text(
                                            'Đổi mật khẩu',
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
                      )),
                ))));

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
