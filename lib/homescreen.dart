import 'dart:math';

import 'package:cybersecure/component/navigationmenu.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool hasrotated = false;
  @override
  void initState() {
    super.initState();
    _waitFirstFrame();
  }

  void _waitFirstFrame() async {
    await WidgetsBinding.instance.waitUntilFirstFrameRasterized;
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() => hasrotated = !hasrotated);
  }

  @override
  Widget build(BuildContext context) {
    final _bodystyle =
        Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white);
    final _textstyle = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontSize: 12, color: const Color(0xfff05334));

    return Title(
        title: "CyberSecure",
        color: const Color(0xff242c42),
        child: Container(
          color: const Color(0xff242c42),
          child: Stack(children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (() {
                        Navigator.pushNamed(context, '/contact');
                      }),
                      child: Text(
                        'CONTACT',
                        style: _bodystyle.copyWith(fontSize: 20),
                      ),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(180),
                child: Image.asset(
                  'assets/element3.png',
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 200,
                margin: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        height: 40,
                        child: Image.asset(
                          'assets/element1.png',
                        ),
                      ),
                    ),
                    Text(
                      'Everything around them has ulterior motives\nand going to get even worst such as losing\npersonal data to anonymous',
                      style: _textstyle,
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(right: 20),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        'education is a critical tool\nfor prevention, aiming to\npromote awareness',
                        textAlign: TextAlign.center,
                        style: _textstyle,
                      ),
                      SizedBox(
                          width: 140,
                          height: 100,
                          child:
                              Image.asset('assets/element2.png', height: 100))
                    ]))),
            Align(
              alignment: Alignment.center,
              child: StatefulBuilder(builder: (context, internalstate) {
                return LoopAnimation(
                  tween: Tween(begin: 0.0, end: 4.0),
                  duration: const Duration(seconds: 20),
                  builder: (context, child, double value) {
                    return Transform.rotate(
                      angle: value * pi,
                      child: Padding(
                        padding: const EdgeInsets.all(100),
                        child: Image.asset(
                          'assets/logo.png',
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            const NavigationMenu(screenroute: '/cybercrime')
          ]),
        ));
  }
}
