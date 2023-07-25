import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../pop_up/setting.dart';

// ignore: camel_case_types
class setting_screenshot extends StatefulWidget {
  const setting_screenshot({
    Key? key,
  }) : super(key: key);

  @override
  State<setting_screenshot> createState() => _setting_screenshotState();
}

// ignore: camel_case_types
class _setting_screenshotState extends State<setting_screenshot> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(),
          atRestEffect: WidgetRestingEffects.rotate(),
          child: Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.amber,
                                  border: Border.all(width: 0.1)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/setting.png',
                                    width: 30,
                                  ),
                                  const Text(
                                    'Cài đặt',
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
                        height: 150,
                        width: 500.0,
                        child: setting(),
                      ),
                    ),
                    // actions: [
                    //   TextButton(
                    //       onPressed: () => Navigator.pop(context),
                    //       child: Text('ok'))
                    // ],
                  );
                },
                icon: Image.asset('assets/icons/setting.png'),
                iconSize: 30,
              )),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/camera.png'),
          iconSize: 30,
        )
      ],
    );
  }
}
