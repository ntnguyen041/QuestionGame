// ignore_for_file: must_be_immutable, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/question.dart';
import 'package:flutter_application_1/model/user.dart';
import '../components/header_bar.dart';
import '../model/room.dart';

class multi_play extends StatefulWidget {
  multi_play({super.key, required this.player, required this.room});
  Player player;
  Room room;
  @override
  State<multi_play> createState() => _multi_playState();
}

class _multi_playState extends State<multi_play>
    with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _fireRoom = FirebaseFirestore.instance;
  final totalQuestion = 15;
  bool isLock = false;
  int index = 0;
  int point = 0;

  //
  String? image = "";
  int? pointuser = 0;

  void checkuser() {
    if (_auth.currentUser!.email == widget.room.player1?.email) {
      image = widget.room.player2?.avatar;
      pointuser = widget.room.player2?.point;
    } else {
      image = widget.room.player1?.avatar;
      pointuser = widget.room.player1?.point;
    }
  }

  // update diem
  void update() {
    var user1 = widget.room.player1?.email.toString();
    var user2 = widget.room.player2?.email.toString();

    if (_auth.currentUser!.email == user1) {
      debugPrint('user1');
      _fireRoom.collection("Rooms").doc(widget.room.id.toString()).update({
        'player1': {
          'Point': point,
          'Avatar': widget.room.player1?.avatar,
          'DisplayName': widget.room.player1?.username,
          'email': widget.room.player1?.email,
        }
      });
    } else {
      debugPrint('user2');
      _fireRoom.collection("Rooms").doc(widget.room.id.toString()).update({
        'player2': {
          'Point': point,
          'Avatar': widget.room.player2?.avatar,
          'DisplayName': widget.room.player2?.username,
          'email': widget.room.player2?.email,
        }
      });
    }
  }
// lich su

  Future save() async {
    await _fireRoom
        .collection('History')
        .doc(widget.room.id.toString())
        .get()
        .then((value) async {
      if (!value.exists) {
        if (widget.player.email == widget.room.player1?.email) {
          String valueuser1 = "thắng";
          String valueuser2 = "thua";
          String? username = widget.room.player1?.username;
          String? usernamek = widget.room.player2?.username;
          if (point < pointuser!) {
            valueuser1 = "thua";
            valueuser2 = "thắng";
          }
          if (_auth.currentUser!.email != widget.room.player1?.email) {
            username = widget.room.player2?.username;
            usernamek = widget.room.player1?.username;
          }
          // máy minh
          await _fireRoom.collection('history').doc().set({
            'competitor': usernamek,
            'result': valueuser1,
            'uid': _auth.currentUser!.email,
            'time': DateTime.now(),
          });
          // may khach
          await _fireRoom.collection('history').doc().set({
            'competitor': username,
            'result': valueuser2,
            'uid': widget.player.email == widget.room.player1?.email
                ? widget.room.player2?.email
                : widget.room.player1?.email,
            'time': DateTime.now(),
          });
        }
      }
    });
  }

// check avatar poin

  void nextQuest(int p, bool value) {
    if (isLock == true) {
      return;
    } else if (index == totalQuestion - 1) {
      point += value ? p : 0;
      setState(() {
        isLock = true;
      });
      save().then((value) => ElegantNotification.info(
              width: MediaQuery.of(context).size.width / 4,
              title: const Text("Thông báo"),
              description: const Text("Đang lưu..."))
          .show(context));
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      });
    } else {
      point += value ? p : 0;
      isLock = true;
      setState(() {});
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _controller.reset();
          index++;
          isLock = false;
        });
      });
      //
    }
    update();
  }

  List<Question> questions = [];
  Future loadQuestion() async {
    await _fireStore
        .collection("SimpleQuestions")
        .where("type.id", isEqualTo: 2)
        .snapshots()
        .forEach((element) {
      for (var docs in element.docs) {
        questions.add(Question.fromDocumentSnapshot(docs));
      }
    });
    questions.shuffle();
  }

  late Animation _animation;
  late AnimationController _controller;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 15));
    _animation = Tween<double>(begin: 0.05, end: 0.5).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }
  // read time

  @override
  Widget build(BuildContext context) {
    loadQuestion();
    checkuser();
    var snapshots = _fireStore
        .collection("Rooms")
        .where("id", isEqualTo: widget.room.id)
        .snapshots();
    return StreamBuilder(
        stream: snapshots,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data!.docs;
          _auth.currentUser!.email == widget.room.player1?.email
              ? pointuser = data[0]['player2.Point']
              : pointuser = data[0]['player1.Point'];
          _controller.addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              nextQuest(0, false);
            }
          });
          _controller.forward();
          return Scaffold(
              resizeToAvoidBottomInset: true,
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.gif"), fit: BoxFit.cover),
                ),
                padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                child: SafeArea(
                  child: Column(children: [
                    header_bar(
                      player: widget.player,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.blueAccent.withOpacity(0.3),
                              border: Border.all(width: 1)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          _animation.value,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                      margin: const EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(
                                            width: 0, color: Colors.black),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                      margin: const EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(
                                          color:
                                              Colors.transparent.withOpacity(0),
                                          border: Border.all(
                                              width: 0, color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                      255, 178, 177, 169)
                                                  .withOpacity(0.5),
                                              blurRadius: 8,
                                              offset: const Offset(0, 8),
                                            ),
                                          ]),
                                      child: Text(
                                        questions[index].title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        softWrap: true,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () => nextQuest(
                                            questions[index].point,
                                            0 == questions[index].key),
                                        child: AnswerWidget(
                                          answer: questions[index].answers[0],
                                          isKey: 0 == questions[index].key,
                                          isLock: isLock,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => nextQuest(
                                            questions[index].point,
                                            1 == questions[index].key),
                                        child: AnswerWidget(
                                          answer: questions[index].answers[1],
                                          isKey: 1 == questions[index].key,
                                          isLock: isLock,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () => nextQuest(
                                            questions[index].point,
                                            2 == questions[index].key),
                                        child: AnswerWidget(
                                          answer: questions[index].answers[2],
                                          isKey: 2 == questions[index].key,
                                          isLock: isLock,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => nextQuest(
                                            questions[index].point,
                                            3 == questions[index].key),
                                        child: AnswerWidget(
                                          answer: questions[index].answers[3],
                                          isKey: 3 == questions[index].key,
                                          isLock: isLock,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 200,
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.grey.shade300
                                            .withOpacity(0.6)),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: <Widget>[
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                  'assets/icons/camera.png')),
                                          IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    // barrierDismissible: false,
                                                    builder:
                                                        (context) =>
                                                            AlertDialog(
                                                              title: Text(
                                                                  'Xác nhận thoát khỏi trận đấu'),
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          246,
                                                                          246,
                                                                          246),
                                                              content:
                                                                  Container(
                                                                height: 50,
                                                                width: 300.0,
                                                                child: Column(
                                                                    children: [
                                                                      Text(
                                                                          'Bạn sẽ bị xử thua với hành vi của mình'),
                                                                      Text(
                                                                          'Bạn vẫn muốn thoát trận.                        '),
                                                                    ]),
                                                              ),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          context,
                                                                          'Cancel'),
                                                                  child: const Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      save().then((value) => ElegantNotification.info(
                                                                              width: MediaQuery.of(context).size.width / 4,
                                                                              title: const Text("Thông báo"),
                                                                              description: const Text("Đang lưu..."))
                                                                          .show(context));
                                                                      Future.delayed(
                                                                          const Duration(
                                                                              seconds: 2),
                                                                          () {
                                                                        Navigator.pushNamedAndRemoveUntil(
                                                                            context,
                                                                            'home',
                                                                            (route) =>
                                                                                false);
                                                                      });

                                                                      Navigator.pop(
                                                                          context,
                                                                          'OK');
                                                                      Navigator.pushNamedAndRemoveUntil(
                                                                          context,
                                                                          'home',
                                                                          (route) =>
                                                                              false);
                                                                    },
                                                                    child: Text(
                                                                        'OK'))
                                                              ],
                                                            ));
                                              },
                                              icon: Image.asset(
                                                  'assets/icons/logout.png')),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                  'assets/icons/heart.png')),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                  'assets/icons/100.png')),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                  'assets/icons/50.png'))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text("Điểm: ${point}"),
                                      Text(
                                        "Câu: ${(index + 1)} / $totalQuestion",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 200,
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.grey.shade300
                                            .withOpacity(0.6)),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/img/${image}"),
                                          ),
                                          Text("Điểm :${pointuser}"),
                                          IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    // barrierDismissible: false,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  172,
                                                                  22,
                                                                  25,
                                                                  241),
                                                          content: Container(
                                                              height: 250,
                                                              child:
                                                                  Image.asset(
                                                                'assets/vitory/thatbai.png',
                                                                fit:
                                                                    BoxFit.fill,
                                                              )),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      context,
                                                                      'Cancel'),
                                                              child: const Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context,
                                                                      'OK');
                                                                  Navigator.pushNamedAndRemoveUntil(
                                                                      context,
                                                                      'home',
                                                                      (route) =>
                                                                          false);
                                                                },
                                                                child:
                                                                    Text('OK'))
                                                          ],
                                                        ));
                                              },
                                              icon: Image.asset(
                                                  'assets/icons/heart.png')),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                  'assets/icons/100.png')),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                  'assets/icons/50.png'))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              ));
        });
  }
}

class AnswerWidget extends StatefulWidget {
  String answer;
  bool isKey;
  bool isLock;
  AnswerWidget({
    required this.answer,
    required this.isKey,
    required this.isLock,
    super.key,
  });

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 8,
      margin: const EdgeInsets.fromLTRB(3, 8, 3, 0),
      decoration: BoxDecoration(
        color: widget.isLock
            ? widget.isKey
                ? Colors.green
                : Colors.red
            : Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Text(
        widget.answer,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}
