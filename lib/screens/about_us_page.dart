import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';
import 'dart:async';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  final info = '''
  We are small company that helping people to understand 
  Yoga poses and steps. We created following application 
  to get people involved and learn Yoga at any time.
  ''';

  launchMailto() async {
    final mailtoLink = Mailto(
      to: ['850043@swasnea.ac.uk'],
      cc: ['helpdesk@swansea.ac.uk'],
      subject: 'Hi from YogaApp',
      body: 'Is your time to type something...',
    );
    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                info
                    .replaceAll(RegExp(r'\n'), '')
                    .replaceAll(RegExp(r'  '), ''),
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Text(
                    "\nDeveloper: ",
                    style: TextStyle(fontSize: 24),
                  ),
                  Spacer(),
                  Text(
                    "\nSlawomir Zjawiony",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => launchMailto(),
                child: Text('--,-`--@   Contact Us   @--`--,--'),
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
