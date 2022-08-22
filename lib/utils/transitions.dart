import 'package:flutter/material.dart';

const animationCurve = Curves.easeInOut;

Route fadeRoute(Widget child, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionDuration: const Duration(milliseconds: 69),
    reverseTransitionDuration: const Duration(milliseconds: 69),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // return FadeTransition(opacity: animation, child: _child);
      // return FadeTransition(
      //     opacity: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      //         parent: animation,
      //         curve: const Cubic(.02, .46, .39, 1.04),
      //         reverseCurve: Curves.linear)),
      //     child: child);
      return SlideTransition(
        position: Tween<Offset>(
                begin: const Offset(0, 0), end: const Offset(-0.02, 0))
            .animate(CurvedAnimation(
                parent: secondaryAnimation,
                curve: animationCurve,
                // curve: const Cubic(.02, .46, .39, 1.04),
                reverseCurve: Curves.linear)),
        child: FadeTransition(
          opacity: Tween<double>(begin: 1, end: 0.5).animate(CurvedAnimation(
              parent: secondaryAnimation,
              curve: animationCurve,
              // curve: const Cubic(.02, .46, .39, 1.04),
              reverseCurve: Curves.linear)),
          child: FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                  parent: animation,
                  curve: const Cubic(.02, .46, .39, 1.04),
                  reverseCurve: Curves.linear)),
              child: child),
        ),
      );
    },
  );
}

Route slowFadeRoute(Widget child, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionDuration: const Duration(milliseconds: 250),
    reverseTransitionDuration: const Duration(milliseconds: 100),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // return FadeTransition(opacity: animation, child: _child);
      return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
              parent: animation,
              curve: const Cubic(.02, .46, .39, 1.04),
              reverseCurve: Curves.linear)),
          child: child);
    },
  );
}
