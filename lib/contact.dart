import 'package:cybersecure/component/navigationmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final ScrollController _docScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final _bodytext = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontSize: 15, color: Colors.black54);
    final _bodytext2 = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontSize: 20, color: Colors.white54);
    return Title(
      title: "CyberSecure Contact",
      color: Colors.black,
      child: Container(
        color: const Color(0xff242c42),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(30).copyWith(left: 0),
                          color: Colors.white,
                          width: double.maxFinite,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 22.0, bottom: 30),
                                  child: Image.asset(
                                    'assets/contact.png',
                                    width: 280,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, bottom: 20.0),
                                  child: Text(
                                    'EMAIL: taweechock.pathom@gmail.com',
                                    style: _bodytext,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, bottom: 20.0),
                                  child: Text(
                                    '              cybercrime.th@outlook.com',
                                    style: _bodytext,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, bottom: 20.0),
                                  child: Text(
                                    'PHONE: 0830221539',
                                    style: _bodytext,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    '@cybercrime.th',
                                    style: _bodytext,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: double.maxFinite,
                        color: const Color(0xffea3626),
                        child: Row(children: [
                          Expanded(
                              child: Text(
                            'Every cybercrime incident should be reported to the Thai Cyber Crime Investigation Bureau. Victims of cybercrime incidents can report their incidents to thaipoliceonline.com  A victim only needs to report their incident once to ensure that all the other agencies are notified. hightechcrime.org',
                            style: _bodytext.copyWith(color: Colors.white),
                            textAlign: TextAlign.right,
                          )),
                          Expanded(
                            child: Image.asset('assets/logo2.png'),
                          )
                        ]),
                      ))
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(30).copyWith(top: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              'assets/report.png',
                              height: 200,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launchUrl(
                                  Uri.parse("https://thaipoliceonline.com/"));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                'thaipoliceonline.com',
                                style: _bodytext2,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launchUrl(
                                  Uri.parse("https://www.hightechcrime.org/"));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                'hightechcrime.org',
                                style: _bodytext2,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (() {
                              launchUrl(
                                  Uri.parse("https://tcsd.go.th/contact-us/"));
                            }),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                'tcsd.go.th/contact-us',
                                style: _bodytext2,
                              ),
                            ),
                          ),
                        ]),
                  ),
                )
              ],
            ),
            const NavigationMenu(
              screenroute: '/Contact',
            ),
          ],
        ),
      ),
    );
  }
}
