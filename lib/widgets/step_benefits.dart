import 'package:flutter/material.dart';

import './bullet_row_text.dart';

class StepBenefits extends StatelessWidget {
  List data;

  StepBenefits(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Benefits information",
          style: TextStyle(fontSize: 20),
        ),
        for (var i in data) BulletRowText(item: i),
      ],
    );
  }
}
