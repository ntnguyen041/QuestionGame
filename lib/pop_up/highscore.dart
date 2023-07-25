import 'package:flutter/material.dart';

// ignore: camel_case_types
class ingame_screen extends StatefulWidget {
  const ingame_screen({super.key});

  @override
  State<ingame_screen> createState() => _ingame_screenState();
}

// ignore: camel_case_types
class _ingame_screenState extends State<ingame_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 255, 193, 7),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.6,
                height: MediaQuery.of(context).size.height / 1.5,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          color: const Color.fromARGB(182, 255, 255, 255),
                          borderRadius: BorderRadius.circular(18.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/subjects/math.png'),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/icons/menu.png')),
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/donghocat.png')),
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/icons/lich.png')),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(18.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(182, 255, 255, 255),
                                offset: Offset(2.0, 2.0),
                                blurRadius: 4.0,
                                spreadRadius: 2.0,
                              )
                            ]),
                        child: Column(
                          children: [
                            Stack(children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Image.asset(
                                    'assets/icons/exit.png',
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/icons/999.png'),
                                  const Text(
                                    "Xếp Hạng",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children:const [
                                     single_rank(),
                                     single_rank(),
                                     single_rank(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class single_rank extends StatelessWidget {
  const single_rank({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 3, 8, 0),
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(18.0),
        color: const Color.fromARGB(255, 175, 99, 132),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "1",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            "AdminABC",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Text(
              "15:00",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
