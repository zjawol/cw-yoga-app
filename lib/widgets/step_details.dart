import 'package:flutter/material.dart';

import './bullet_row_text.dart';

class StepDetails extends StatelessWidget {
  List details;

  StepDetails(this.details);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Exercise information",
          style: TextStyle(fontSize: 20),
        ),
        for (var i in details) BulletRowText(item: i),
      ],
    );
  }
}
