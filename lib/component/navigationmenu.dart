import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key key, this.screenroute}) : super(key: key);
  final String screenroute;

  void handleNavigation(String route, BuildContext context) async {
    if (screenroute == route) return;
    if (route == '/cybercrime') {
      await Navigator.pushNamed(context, '/');
      return;
    }
    // if (route == '/R') {
    //   launchUrl(Uri.parse("https://www.google.com"),
    //       mode: LaunchMode.externalApplication);
    // }
    await Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navigationButtonWidget('E', 'CYBERCRIME', () {
            handleNavigation('/cybercrime', context);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navigationButtonWidget('R', 'REPORT', () {
                handleNavigation('/report', context);
              }),
              _navigationButtonWidget('Y', 'ACTIVITY', () {
                handleNavigation('/activity', context);
              }),
            ],
          ),
          _navigationButtonWidget('B', 'BIOGRAPHY', () {
            handleNavigation('/biography', context);
          }),
        ],
      ),
    );
  }

  Widget _navigationButtonWidget(String route, String name, Function navigate) {
    bool ishover = false;
    bool isanimating = false;
    return GestureDetector(
      onTap: navigate,
      child: StatefulBuilder(builder: (context, internalstate) {
        return MouseRegion(
            hitTestBehavior: HitTestBehavior.opaque,
            onEnter: (event) {
              internalstate(
                () => ishover = true,
              );
              isanimating = true;
              Future.delayed(const Duration(milliseconds: 10))
                  .then((value) => isanimating = false);
            },
            onExit: (event) {
              if (isanimating) return;
              internalstate(
                () => ishover = false,
              );
            },
            child: AnimatedSwitcher(
              switchInCurve: Curves.ease,
              switchOutCurve: Curves.ease,
              duration: const Duration(milliseconds: 200),
              reverseDuration: const Duration(milliseconds: 200),
              layoutBuilder:
                  (Widget currentChild, List<Widget> previousChildren) {
                List<Widget> children = previousChildren;
                if (currentChild != null) {
                  children = children.toList()..add(currentChild);
                }
                return Stack(
                  children: children,
                  alignment: getalignment(route),
                );
              },
              transitionBuilder: (Widget child, Animation<double> animation) {
                if (child.key == Key('${route}2')) {
                  return FadeTransition(
                      opacity: animation,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: child,
                      ));
                } else {
                  return SizeTransition(
                    axis: Axis.horizontal,
                    axisAlignment: getAxisAlignment(route),
                    sizeFactor: animation,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: child,
                    ),
                  );
                }
              },
              child: ishover
                  ? Text(name,
                      key: Key('${route}1'),
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(color: Colors.white))
                  : Text(route,
                      key: Key('${route}2'),
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(color: Colors.white30)),
            ));
      }),
    );
  }

  double getAxisAlignment(String route) {
    switch (route) {
// case'E' :break;
      case 'R':
        return -1;
      case 'Y':
        return 1;

// case'B' :break;
      default:
        return 0;
    }
  }

  Alignment getalignment(String route) {
    switch (route) {
// case'E' :break;
      case 'R':
      case 'B':
        return Alignment.centerLeft;
      case 'Y':
      case 'E':
        return Alignment.centerRight;
// case'B' :break;
      default:
        return Alignment.center;
    }
  }
}
