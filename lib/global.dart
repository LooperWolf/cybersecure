import 'package:flutter/material.dart';

final global = _Global.instance();

class _Global {
  factory _Global.instance() => _instance;
  _Global._internal();
  static final _instance = _Global._internal();
  final ImageProvider poster = const AssetImage('assets/bioposter.png');
  final ImageProvider htp = const AssetImage('assets/HTP.png');
  final ImageProvider act1 = const AssetImage('assets/activity1.png');
  final ImageProvider act2 = const AssetImage('assets/activity2.png');

  void start(BuildContext context) {
    precacheImage(const AssetImage("assets/logo.png"), context);
    precacheImage(const AssetImage("assets/logo2.png"), context);
    precacheImage(const AssetImage("assets/activity1.png"), context);
    precacheImage(const AssetImage("assets/activity2.png"), context);
    precacheImage(const AssetImage("assets/HTP.png"), context);
    precacheImage(const AssetImage("assets/bioposter.png"), context);
    precacheImage(const AssetImage("assets/element1.png"), context);
    precacheImage(const AssetImage("assets/element2.png"), context);
    precacheImage(const AssetImage("assets/element3.png"), context);
    precacheImage(const AssetImage("assets/report.png"), context);
    precacheImage(const AssetImage("assets/contact.png"), context);
    precacheImage(const AssetImage("assets/sticker.png"), context);
    precacheImage(const AssetImage("assets/report13.png"), context);
    precacheImage(const AssetImage("assets/report12.png"), context);
    precacheImage(const AssetImage("assets/report11.png"), context);
    precacheImage(const AssetImage("assets/report10.png"), context);
    precacheImage(const AssetImage("assets/report9.png"), context);
    precacheImage(const AssetImage("assets/report8.png"), context);
    precacheImage(const AssetImage("assets/report7.png"), context);
    precacheImage(const AssetImage("assets/report6.png"), context);
    precacheImage(const AssetImage("assets/report5.png"), context);
    precacheImage(const AssetImage("assets/report4.png"), context);
    precacheImage(const AssetImage("assets/report3.png"), context);
    precacheImage(const AssetImage("assets/report2.png"), context);
    precacheImage(const AssetImage("assets/report1.png"), context);
  }
}
