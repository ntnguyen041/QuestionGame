import 'package:flutter/material.dart';
import 'package:flutter_application_1/pop_up/bag.dart';
import 'package:flutter_application_1/pop_up/shop.dart';
import 'package:indexed/indexed.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:flutter_application_1/pop_up/profile.dart';

import '../model/user.dart';
import '../pop_up/paydiscount.dart';
import '../screens/tableRank.dart';
// import 'icon_button.dart';

// ignore: must_be_immutable, camel_case_types
class header_bar extends StatefulWidget {
  header_bar({super.key, required this.player});
  Player player;

  @override
  State<header_bar> createState() => _header_barState();
}

// ignore: camel_case_types
class _header_barState extends State<header_bar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Indexer(
            children: [
              Indexed(
                index: 3,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(0, 246, 246, 246),
                              content: SizedBox(
                                height: MediaQuery.of(context).size.height / 1,
                                width: MediaQuery.of(context).size.width / 2,
                                child: const profile_screen(),
                              ),
                            ));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/img/${widget.player.avatar}'), //${user[0]['Avatar']}
                  ),
                ),
              ),
              Indexed(
                index: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(143, 16, 10, 10),
                      borderRadius: BorderRadius.circular(20.0)),
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  margin: const EdgeInsets.only(bottom: 15, top: 10, left: 13),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 5, 0, 5),
                        child: Text(
                          widget.player.username.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.yellow.shade600),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Image.asset(
                            'assets/icons/coin.png',
                            width: 40,
                            height: 40,
                          )),
                      Text(
                        "${widget.player.coin}",
                        style: const TextStyle(color: Colors.white),
                      ),
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
                      const Text(
                        "4:02",
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/icons/add.png'),
                        iconSize: 15,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                              backgroundColor: Color.fromARGB(0, 246, 246, 246),
                              content: SizedBox(
                                height: 280,
                                width: 700.0,
                                child: TableRank(),
                              ),
                            ));
                  },
                  icon: Image.asset('assets/icons/trophy.png'),
                  iconSize: 40,
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Túi Đồ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
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
                              backgroundColor:
                                  const Color.fromARGB(132, 219, 212, 212),
                              content: const SizedBox(
                                height: 280,
                                width: 700.0,
                                child: Bag(),
                              ),
                            ));
                  },
                  icon: Image.asset('assets/icons/inventory.png'),
                  iconSize: 40,
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 255, 193, 7),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/setting.png',
                                              width: 30,
                                            ),
                                            const Text(
                                              'Cửa hàng',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                const AlertDialog(
                                                  content: SizedBox(
                                                    height: 200,
                                                    width: 600.0,
                                                    child: paydiscourt(),
                                                  ),
                                                ));
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.amber,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/setting.png',
                                              width: 30,
                                            ),
                                            const Text(
                                              'Nạp thẻ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              content: const SizedBox(
                                height: 200,
                                width: 600.0,
                                child: shop(),
                              ),
                            ));
                  },
                  icon: Image.asset('assets/icons/shop.png'),
                  iconSize: 40,
                ),
              ),
              Expanded(
                child: WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromLeft(),
                  atRestEffect: WidgetRestingEffects.swing(),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/logo.png'),
                    iconSize: 40,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
