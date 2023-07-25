import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';


class profile_com extends StatefulWidget {
  profile_com({super.key, required this.user, required this.top});
  Player user;
  int top;

  @override
  State<profile_com> createState() => _profile_comState();
}

String CheckRank(int p) {
  if (p <= 1)
    return "Đồng";
  else if (p <= 50)
    return "Bạc";
  else if (p <= 100)
    return "Vàng";
  else if (p <= 150)
    return "Bạch Kim";
  else if (p > 150) return "Kim Cương";
  return "Không";
}

class _profile_comState extends State<profile_com> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 255, 193, 7),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color:
                            Color.fromARGB(0, 149, 117, 205).withOpacity(0.8),
                        border: Border.all(width: 2)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/img/${widget.user.avatar}'),
                                )),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        widget.user.username.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Rank: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          CheckRank(int.parse(
                                              widget.user.rank.toString())),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
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
                        Text(
                          "Xếp hạng",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/medal.png',
                                  ),
                                  Text(
                                    widget.top.toString() + "/100",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/trophy.png',
                                  ),
                                  Text(widget.top.toString() + "/100",
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
                                  Text("2" + "/100",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
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
                    padding: EdgeInsets.only(left: 15),
                    child: Image.asset(
                      'assets/icons/coin.png',
                      width: 40,
                      height: 40,
                    )),
                Text("1000"),
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
                Text("4:02"),
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
