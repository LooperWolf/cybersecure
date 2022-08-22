import 'package:cybersecure/component/navigationmenu.dart';
import 'package:cybersecure/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';

class Activity extends StatefulWidget {
  const Activity({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  final ScrollController _docScrollController = ScrollController();
  final TextEditingController _passwordController = TextEditingController();
  String get _password => _passwordController.text;
  set _password(value) => _passwordController.text = value;
  var _strength = 0.0;
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  String _displayText = 'Please enter a password';

  void _checkPassword(String value) {
    if (_password.isEmpty) {
      setState(() {
        _strength = 0;
        _displayText = 'Please enter a password';
      });
    } else if (_password.length < 6) {
      setState(() {
        _strength = 1 / 4;
        _displayText = 'Password too short!';
      });
    } else if (_password.length < 8) {
      setState(() {
        _strength = 2 / 4;
        _displayText = 'Your password is meh';
      });
    } else {
      if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
        setState(() {
          _strength = 3 / 4;
          _displayText = 'Your password is ok';
        });
      } else {
        setState(() {
          _strength = 1;
          _displayText = 'Your password is strong';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bodystyle =
        Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white);
    return Title(
      title: "CyberSecure Activity",
      color: Colors.black,
      child: Container(
        color: const Color(0xff242c42),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: Row(
                            children: [
                              Text(
                                '(Cyber)secure / ',
                                style: bodystyle.copyWith(fontSize: 30),
                              ),
                              Text(
                                'Activity',
                                style: bodystyle.copyWith(
                                    fontSize: 30,
                                    color: const Color(0xfff05334)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: Text(
                            'FREE STICKERS ARE GIVEN FOR FILLING IN THE FORMS',
                            maxLines: 1,
                            style: bodystyle.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          'We hereby create the campaign for anyone who\nusually see cybercrime as a threat. The campaign\nis all about creating awareness among the people, childrens, and teenagers',
                          maxLines: 4,
                          style: bodystyle.copyWith(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Image.asset('assets/sticker.png'),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30.0),
                            child: Column(children: <Widget>[
                              TextField(
                                controller: _passwordController,
                                style: bodystyle,
                                decoration: InputDecoration(
                                    focusColor: Colors.purple[300],
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xfff05334)),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.white54),
                                    )),
                                onChanged: (value) {
                                  setState(() {
                                    _checkPassword(value);
                                  });
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: LinearProgressIndicator(
                                  value: _strength,
                                  backgroundColor: Colors.grey[300],
                                  color: _strength <= 1 / 4
                                      ? Colors.red
                                      : _strength == 2 / 4
                                          ? Colors.yellow
                                          : _strength == 3 / 4
                                              ? Colors.blue
                                              : Colors.green,
                                  minHeight: 15,
                                ),
                              ),
                              Text(
                                _displayText,
                                style: bodystyle,
                              )
                            ]))
                      ],
                    ),
                  ),
                ),
                Builder(builder: (context) {
                  final border =
                      Border.all(color: const Color(0xfff05334), width: 4);
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(5),
                                      border: border),
                                  child: Image(
                                    image: global.act1,
                                  ))),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(5),
                                      border: border),
                                  child: Image(
                                    image: global.act2,
                                  ))),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
            const NavigationMenu(
              screenroute: '/activity',
            ),
          ],
        ),
      ),
    );
  }
}
