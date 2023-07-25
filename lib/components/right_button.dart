import 'package:flutter/material.dart';

// ignore: camel_case_types
class right_button extends StatelessWidget {
  const right_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 5.3,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Colors.deepPurple.shade300.withOpacity(0.8))),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Vượt ải",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    Image.asset('assets/icons/goal.png')
                  ],
                )),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 5.3,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Colors.deepPurple.shade300.withOpacity(0.8))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Xếp hạng",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      Image.asset('assets/icons/goal.png')
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
