import 'package:cybersecure/component/navigationmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Report extends StatefulWidget {
  const Report({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final links = [
    "Roo Than",
    "Kaspersky",
    "Bro KH",
    "Tiktok",
    "6SCAMS",
    "Conti",
    "Call Center",
    "iPhone XR",
    "MCS",
    "Triple Extortion Ransomware",
    "IoT",
    "Joker Game",
    "Deepfake",
  ];
  String get hoverover => hoveroverNotifier.value;
  set hoverover(value) => hoveroverNotifier.value = value;
  ValueNotifier<String> hoveroverNotifier = ValueNotifier("");
  String goto(String links) {
    switch (links) {
      case "Bro KH":
        return "https://www.bbc.com/thai/thailand-60367956";
      case "6SCAMS":
        return "https://today.line.me/th/v2/article/pe3zLNe";
      case "Conti":
        return "https://www.thairath.co.th/news/tech/2375175";
      case "Call Center":
        return "https://www.springnews.co.th/news/826702";
      case "Triple Extortion Ransomware":
        return "https://news.thaipbs.or.th/content/309313";
      case "Roo Than":
        return "https://news.thaipbs.or.th/content/299614";
      case "Joker Game":
        return "https://www.blognone.com/node/127426";
      case "iPhone XR":
        return "https://www.thairath.co.th/news/crime/2226786";
      case "Kaspersky":
        return "https://mgronline.com/cyberbiz/detail/9650000067658";
      case "Deepfake":
        return "https://mgronline.com/cyberbiz/detail/9650000056698";
      case "Tiktok":
        return "https://mgronline.com/specialscoop/detail/9650000039890";
      case "MCS":
        return "https://www.ryt9.com/s/prg/3325601";
      case "IoT":
        return "https://www.sec.or.th/TH/PublishingImages/Pages/CyberResilience-News/cyber-news-02L.png";
    }
  }

  String picture(String link) {
    switch (link) {
      case "Roo Than":
        return "assets/report2.png";
      case "Kaspersky":
        return "assets/report3.png";
      case "Bro KH":
        return "assets/report4.png";
      case "Tiktok":
        return "assets/report5.png";
      case "6SCAMS":
        return "assets/report6.png";
      case "Conti":
        return "assets/report7.png";
      case "Call Center":
        return "assets/report8.png";
      case "iPhone XR":
        return "assets/report9.png";
      case "MCS":
        return "assets/report10.png";
      case "Triple Extortion Ransomware":
        return "assets/report11.png";
      case "IoT":
        return "assets/report12.png";
      case "Joker Game":
        return "assets/report13.png";
      case "Deepfake":
        return "assets/report1.png";
      default:
        return null;
    }
  }

  final ScrollController _docScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final _bodystyle =
        Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white);
    return Title(
      title: "CyberSecure Report",
      color: Colors.black,
      child: Container(
        color: const Color(0xff242c42),
        child: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: [
                    Text(
                      '(Cyber)secure / ',
                      style: _bodystyle.copyWith(fontSize: 35),
                    ),
                    Text(
                      'Report',
                      style: _bodystyle.copyWith(
                          fontSize: 35, color: const Color(0xfff05334)),
                    ),
                  ],
                )),
            Positioned.fill(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 200.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _getlink(links[0]),
                          _getlink(links[1]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _getlink(links[2]),
                              _getlink(links[3]),
                            ],
                          ),
                          _getlink(links[4]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _getlink(links[5]),
                              _getlink(links[6]),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _getlink(links[7]),
                              _getlink(links[8]),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _getlink(links[9]),
                              _getlink(links[10]),
                            ],
                          ),
                          _getlink(links[11]),
                          _getlink(links[12]),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: hoveroverNotifier,
                      builder: (context, value, child) {
                        final pic = picture(value);
                        if (pic == null) {
                          return Container();
                        }
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 200)
                              .copyWith(right: 100),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(5),
                              border: Border.all(
                                  color: const Color(0xfff05334), width: 4)),
                          child: Image.asset(
                            pic,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            const NavigationMenu(
              screenroute: '/report',
            ),
          ],
        ),
      ),
    );
  }

  Widget _getlink(String link) {
    bool ishover = false;
    //bool isanimating = false;
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(goto(link)));
      },
      child: StatefulBuilder(builder: (context, internalstate) {
        return MouseRegion(
            hitTestBehavior: HitTestBehavior.opaque,
            onEnter: (event) {
              internalstate(
                () {
                  ishover = true;
                  hoverover = link;
                },
              );
            },
            onExit: (event) {
              //if (isanimating) return;
              internalstate(
                () {
                  ishover = false;
                  hoverover = "";
                },
              );
            },
            child: AnimatedSwitcher(
              switchInCurve: Curves.ease,
              switchOutCurve: Curves.ease,
              duration: const Duration(milliseconds: 200),
              reverseDuration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                    opacity: animation,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: child,
                    ));
              },
              child: ishover
                  ? Text(link,
                      key: Key('${link}1'),
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(color: Colors.white, fontSize: 15))
                  : Text(link,
                      key: Key('${link}2'),
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(color: Colors.white30, fontSize: 15)),
            ));
      }),
    );
  }
}
