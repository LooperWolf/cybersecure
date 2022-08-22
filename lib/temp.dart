import 'package:cybersecure/component/navigationmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Biography extends StatefulWidget {
  const Biography({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BiographyState();
}

class _BiographyState extends State<Biography> {
  final ScrollController _docScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Title(
      title: "CyberSecure Biography",
      color: Colors.black,
      child: Container(
        color: const Color(0xff242c42),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '(Cyber)SECURE / BIOGRAPHY',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white, fontSize: 17),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _docScrollController,
                child: Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 150,
                    ),
                    for (var i = 0; i < 20; i++) _floatingButton('text', () {}),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 150,
                    ),
                  ],
                ),
              ),
            ),
            const NavigationMenu(
              screenroute: '/biography',
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Builder(builder: (context) {
                bool isHovering = false;
                return MouseRegion(
                  hitTestBehavior: HitTestBehavior.translucent,
                  onEnter: ((event) async {
                    if (isHovering) return;
                    isHovering = true;
                    double dy = 20;
                    while (isHovering) {
                      if (_docScrollController.offset > 0) {
                        _docScrollController.animateTo(
                            _docScrollController.offset - dy,
                            duration: const Duration(milliseconds: 30),
                            curve: Curves.ease);
                      }
                      if (dy < 200) dy += 5;
                      await Future.delayed(const Duration(milliseconds: 10));
                    }
                  }),
                  onExit: ((event) => isHovering = false),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: 40,
                  ),
                );
              }),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Builder(builder: (context) {
                bool isHovering = false;
                return MouseRegion(
                  hitTestBehavior: HitTestBehavior.translucent,
                  onEnter: ((event) async {
                    if (isHovering) return;
                    isHovering = true;
                    double dy = 20;
                    while (isHovering) {
                      if (_docScrollController.offset <
                          _docScrollController.position.maxScrollExtent) {
                        _docScrollController.animateTo(
                            _docScrollController.offset + dy,
                            duration: const Duration(milliseconds: 30),
                            curve: Curves.linear);
                      }
                      if (dy < 200) dy += 5;
                      await Future.delayed(const Duration(milliseconds: 10));
                    }
                  }),
                  onExit: ((event) => isHovering = false),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: 40,
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _floatingButton(String text, Function navigate) {
    bool ishover = false;
    return GestureDetector(
      onTap: navigate,
      child: StatefulBuilder(builder: (context, internalstate) {
        return MouseRegion(
            onEnter: (event) {
              internalstate(
                () => ishover = true,
              );
            },
            onExit: (event) {
              internalstate(
                () => ishover = false,
              );
            },
            child: AnimatedScale(
              scale: ishover ? 1 : 0.99,
              duration: const Duration(milliseconds: 200),
              child: AnimatedOpacity(
                  opacity: ishover ? 1 : 0.2,
                  duration: const Duration(milliseconds: 200),
                  // reverseDuration: const Duration(milliseconds: 200),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.bottomCenter,
                        color: Colors.grey[100],
                        height: 600,
                        width: 300,
                      ),
                      Container(
                        height: 100,
                        width: 300,
                        color: const Color(0xfff05334),
                        child: Text(text,
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(color: Colors.white)),
                      ),
                    ],
                  )),
            ));
      }),
    );
  }
}
