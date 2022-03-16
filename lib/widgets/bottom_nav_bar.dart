import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/steps_provider.dart';

// Widget defining bottom navigation bar
class BottomNavBar extends StatelessWidget {
  void runCycle() {
    final Timer _delayTimer;
    _delayTimer = Timer(Duration(seconds: (1)), () {
      for (int i = 0; i < 24; i++) {
        print("TIMER " + i.toString());
      }
    });
  }
  // void initDelayTimer() {
  //   final Timer _delayTimer;
  //   // int cycles = _repetition * 2 * steps.length;
  //   // int c = 0;
  //   _delayTimer = Timer(Duration(seconds: (stepTime)), () {
  //     // for (var check = 0; check < _cycles - 1; check++) {
  //     // if (_stepTime != 0) {
  //     // if (_currentStepNo > 0 && _currentStepNo < _totalSteps - 1) {
  //     // if (_isAutoSlide && _currentId == (steps.length - 1)) {
  //     //   _currentId = 0;
  //     // } else {
  //     // _currentId++;
  //     // incrementId();
  //     // initDelayTimer();
  //     // }
  //     // if (check == cycles - 1) {
  //     //   toggleAutoSlide();
  //     // }
  //     // }
  //     // notifyListeners();
  //     // }
  //   });
  //   // incrementId();
  //   // notifyListeners();
  // }

  @override
  Widget build(BuildContext context) {
    final poses = Provider.of<Steps>(context);
    // runCycle();
    return BottomAppBar(
      color: Colors.blue,
      child: Row(
        children: [
          IconButton(
            onPressed: () =>
                Navigator.popUntil(context, ModalRoute.withName('/')),
            icon: Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              // gotoPrev();
              // checkAndUpdateButtonStatus();
              poses.decrementId();
            },
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              // gotoNext();
              // checkAndUpdateButtonStatus();
              poses.incrementId();
            },
            icon: Icon(
              Icons.arrow_forward,
            ),
          ),
          Spacer(),
          Text(
            "Pose No: " + (poses.currentId + 1).toString(),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Spacer(),
          // Text("Breating"),
          // Switch(
          //   value: breath,
          //   onChanged: (value) => {breathOn(value)},
          //   activeTrackColor: Colors.lightGreenAccent,
          //   activeColor: Colors.green,
          // ),
          Text("Auto slide"),
          Switch(
            value: poses.isAutoSlide,
            onChanged: (value) => {poses.toggleAutoSlide()},
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
