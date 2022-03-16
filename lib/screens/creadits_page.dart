import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class CreditsPage extends StatelessWidget {
  const CreditsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Credits'),
        ),
        body: Center(
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "Following application used pictures and content from followin page: ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextSpan(
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                      text: "Click here",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var url =
                              "https://www.fitsri.com/yoga/surya-namaskar";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ElevatedButton(
          onPressed: () =>
              Navigator.popUntil(context, ModalRoute.withName('/')),
          child: Text('Back'),
        ));
  }
}
