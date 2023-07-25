import 'package:elegant_notification/elegant_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pop_up/tutolrial.dart';
import 'package:audioplayers/audioplayers.dart';

// ignore: camel_case_types
class setting extends StatefulWidget {
  const setting({
    Key? key,
  }) : super(key: key);
  @override
  State<setting> createState() => _settingState();
}

// ignore: camel_case_types
class _settingState extends State<setting> {
  bool isPlaying = true;
  double hieuung = 20;
  double amluong = 20;
  final _auth = FirebaseAuth.instance;
  final player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 255, 193, 7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Nhạc nền:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Slider(
                    value: amluong,
                    max: 100,
                    divisions: 20,
                    label: amluong.round().toString(),
                    onChanged: (double newvalue) {
                      setState(() {
                        amluong = newvalue;
                      });
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hiệu ứng:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Slider(
                  value: hieuung,
                  max: 100,
                  divisions: 20,
                  label: hieuung.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      hieuung = value;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => {
                    Navigator.pop(context),
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: Row(
                            children: [
                              const Expanded(
                                flex: 3,
                                child: Text(''),
                              ),
                              Expanded(
                                flex: 9,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.amber,
                                      border: Border.all(width: 0.1)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Hướng dẫn',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Expanded(
                                flex: 1,
                                child: Text(''),
                              ),
                              Expanded(
                                flex: 2,
                                child: IconButton(
                                  onPressed: () => {
                                    Navigator.pop(context),
                                  },
                                  icon: Image.asset(
                                    'assets/icons/exit.png',
                                    width: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: const Color.fromARGB(96, 7, 77, 255),
                          content: const SizedBox(
                            height: 220.0,
                            width: 450.0,
                            child: tutolrial(),
                          )),
                      // actions: [
                      //   TextButton(
                      //       onPressed: () => Navigator.pop(context),
                      //       child: Text('ok'))
                      // ],
                    ),
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Hướng dẫn',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(175, 7, 32, 255)),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(15))),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        _auth.signOut().then((value) =>
                            ElegantNotification.error(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    title: const Text("Thông Báo"),
                                    description:
                                        const Text("Đăng Xuất Thành Công"))
                                .show(context));
                        Future.delayed(
                            const Duration(seconds: 1),
                            () => Navigator.pushNamedAndRemoveUntil(
                                context, 'login', (route) => false));
                      } catch (e) {
                        ElegantNotification.error(
                                width: MediaQuery.of(context).size.width / 4,
                                title: const Text("Thông Báo"),
                                description: const Text("Có Lỗi Xảy Ra"))
                            .show(context);
                      }
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(223, 163, 6, 6)),
                        padding: MaterialStatePropertyAll(EdgeInsets.all(15))),
                    child: const Text(
                      'Đăng xuất',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
