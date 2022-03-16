import 'package:flutter/material.dart';

import './bullet_row_text.dart';

class StepBreathing extends StatelessWidget {
  String data;

  StepBreathing(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Breathing information",
          style: TextStyle(fontSize: 20),
        ),
        Text(data),
      ],
    );
  }
}
