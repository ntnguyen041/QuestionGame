import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Pay.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

// ignore: camel_case_types
class paydiscourt extends StatefulWidget {
  const paydiscourt({
    Key? key,
  }) : super(key: key);
  @override
  State<paydiscourt> createState() => _paydiscourtState();
}

// ignore: camel_case_types
class nap extends StatelessWidget {
  const nap({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                 Text(
                  '10.000',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                 Text(
                  '10.000 đậu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class _paydiscourtState extends State<paydiscourt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 255, 193, 7),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(210, 255, 193, 7),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const [
                           Text(
                            'Mệnh giá',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 247, 216, 122),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const [
                           Text(
                            'Quy đổi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const nap(),
              const nap(),
              const nap(),
              const nap(),
              Center(
                child: Row(
                  children: [
                    WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromRight(),
                      atRestEffect: WidgetRestingEffects.size(),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => (const Pay())));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 247, 216, 122),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:const [
                               Text(
                                'Nạp nhanh',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
