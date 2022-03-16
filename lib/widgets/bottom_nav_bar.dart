import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/steps_provider.dart';

// Widget defining bottom navigation bar
class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final poses = Provider.of<Steps>(context);
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
              poses.decrementId();
            },
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
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
          Text("Auto slide"),
          Switch(
            value: poses.isAutoSlide,
            onChanged: (value) => {poses.toggleAutoSlide(value)},
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
