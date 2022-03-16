import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/steps_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final poses = Provider.of<Steps>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Yoga freedom -> Settings'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Display details",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Switch(
                    value: poses.displayDetails,
                    onChanged: (value) => {poses.toggleDisplayDetails()},
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Display breathing",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Switch(
                    value: poses.displayBreathing,
                    onChanged: (value) => {poses.toggleDisplayBreathing()},
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Display benefits",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Switch(
                    value: poses.displayBenefits,
                    onChanged: (value) => {poses.toggleDisplayBenefits()},
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: ElevatedButton(
          onPressed: () =>
              Navigator.pop(context, ModalRoute.withName('/steps')),
          child: Text('OK'),
        ));
  }
}
