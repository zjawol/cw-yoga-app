import 'package:flutter/material.dart';
import '../widgets/card_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Yoga freedom'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  CardButton(
                    myTitle: "Surya Namaskara A",
                    myPath: '/steps',
                  ),
                  CardButton(
                    myTitle: "Surya Namaskara B",
                    myPath: '/steps',
                  ),
                ],
              ),
              Row(
                children: [
                  CardButton(
                    myTitle: "Iyengar Surya Namaskar",
                    myPath: '/steps',
                  ),
                  CardButton(
                    myTitle: "Hatha Surya Namaskar",
                    myPath: '/steps',
                  ),
                ],
              ),
              Row(
                children: [
                  CardButton(
                    myTitle: "Sivananda Sun Salutation",
                    myPath: '/steps',
                  ),
                  CardButton(
                    myTitle: "Ashtanga Surya Namaskar",
                    myPath: '/steps',
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: Text('About Us'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/credits');
                    },
                    child: Text('Credits'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
