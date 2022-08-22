import 'package:cybersecure/biography.dart';
import 'package:cybersecure/contact.dart';
import 'package:cybersecure/report.dart';
import 'package:cybersecure/activity.dart';
import 'package:cybersecure/global.dart';
import 'package:cybersecure/homescreen.dart';
import 'package:cybersecure/utils/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MainRouter());
}

void setPageTitle(String title, BuildContext context) {
  SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
    label: title,
    primaryColor: Theme.of(context).primaryColor.value, // This line is required
  ));
}

// ignore: must_be_immutable
class MainRouter extends StatelessWidget {
  const MainRouter({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    global.start(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
              headline1: TextStyle(color: Colors.white, fontSize: 70))),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return slowFadeRoute(const Scaffold(body: HomeScreen()), settings);
        }
        if (settings.name == '/contact') {
          return slowFadeRoute(const Scaffold(body: Contact()), settings);
        }
        if (settings.name == '/biography') {
          return slowFadeRoute(const Scaffold(body: Biography()), settings);
        }
        if (settings.name == '/report') {
          return slowFadeRoute(const Scaffold(body: Report()), settings);
        }
        if (settings.name == '/activity') {
          return slowFadeRoute(const Scaffold(body: Activity()), settings);
        }
        return slowFadeRoute(const Scaffold(body: HomeScreen()), settings);
      },
    );
  }
}
