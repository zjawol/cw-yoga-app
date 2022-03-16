import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  String myTitle;
  String myPath;

  CardButton({
    required this.myTitle,
    required this.myPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, myPath),
        child: Card(
          child: ListTile(
            title: Center(
              child: Text(
                myTitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          elevation: 8,
          shadowColor: Colors.green,
          margin: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
