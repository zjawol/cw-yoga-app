import 'package:flutter/material.dart';

class BulletRowText extends StatelessWidget {
  const BulletRowText({required this.item});

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\u2022',
          style: TextStyle(
            fontSize: 16,
            height: 1.55,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Flexible(child: Text(item)),
      ],
    );
  }
}
