import 'package:cybersecure/component/navigationmenu.dart';
import 'package:cybersecure/global.dart';
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(221, 26, 26, 26),
                      child: Row(
                        children: [
                          SizedBox(
                            height:
                                (MediaQuery.of(context).size.height * 2 / 3),
                            child: Image(
                              image: global.poster,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Expanded(
                            child: Builder(builder: (context) {
                              final _bodystyle = Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    fontSize: 20,
                                    color: Color.fromARGB(213, 255, 255, 255),
                                  );
                              return Container(
                                color: const Color(0xfff05334),
                                height: (MediaQuery.of(context).size.height *
                                        2 /
                                        3) -
                                    2,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20.0),
                                        child: Text(
                                          'TOP 5 CYBERCRIME IN THAILAND',
                                          style: _bodystyle.copyWith(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: _bodystyle,
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: 'VoIP ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                              text:
                                                  'Voice over Internet Protocol',
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      RichText(
                                        text: TextSpan(
                                          style: _bodystyle,
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: 'Romance Scams',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                              text:
                                                  ' scammer pretending to be an attractive partner',
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      RichText(
                                        text: TextSpan(
                                          style: _bodystyle,
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: 'Phishing ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                              text:
                                                  'The most common form of scam is phishing email or SMS',
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      RichText(
                                        text: TextSpan(
                                          style: _bodystyle,
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: 'Identity Theft',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                              text:
                                                  'use the stolen identities to pretend to be online vendors',
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      RichText(
                                        text: TextSpan(
                                          style: _bodystyle,
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: 'Cyber extortion',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                              text:
                                                  ' demanding money to prevent a threatend attack',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              color: const Color(0xff242c42),
                              padding:
                                  const EdgeInsets.all(8).copyWith(right: 10),
                              child: Image(
                                image: global.htp,
                                fit: BoxFit.fitWidth,
                              )),
                        ),
                        Expanded(
                          flex: 2,
                          child: LayoutBuilder(builder: (context, constraint) {
                            return Container(
                              width: constraint.maxWidth,
                              color: const Color(0xff000000),
                              child: const SingleChildScrollView(
                                  child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                    'The average losses of cybercrime in 2021 rise up to 144%, or \$2.2 million or approximately 72.6 million Thai Baht.\n\nThailand has been faced cybercrime for a long time\nGaining knowledge in order to prevent such an incidents is IMPORTANT\n\nTHESE ARE STEPS ABOUT HOW TO PROTECT AGAINST CYBERCRIME\n\nMake sure your security software is current and update it regularly.\nhaving the latest security software goes a long way toward protecting against viruses, malware and other online threats.\n\nLock or log off your computer when you step away.\nthis ensures that no one else will have access to all your information.\n\nGo offline when you don’t need an internet connection.\nIf your computer is always connected, it increases the chances that hackers and virus scans can invade your computer.\n\nOn your smartphone, on your tablet, on your computer – use PINs or passcodes to protect someone from easily accessing all your information. For social media websites and \napps, be aware of your privacy settings and change them to your comfort level so only the people you want to see information can see it.\n\nIncluding information like your birthdate and the city where you live on your social media profiles can give criminals a more complete picture and make it easier for them to steal your identity.\n\nThink twice about using public Wi-Fi.\nHackers can easily connect to public Wi-Fi and watch your every move, including what passwords and account information you enter while you’re connected.\n\nWhen in doubt, don’t click.\nCyber criminals can compromise your information through tweets, posts and online advertising, in addition to emails. If it looks suspicious, just delete it. Beware of anyone who implores you to act immediately.\n\n\nMAKE YOURSELF SAFE AND (CYBER)SECURE',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              )),
                            );
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const NavigationMenu(
              screenroute: '/biography',
            ),
          ],
        ),
      ),
    );
  }
}
