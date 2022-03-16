import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class StepImage extends StatelessWidget {
  String img;

  StepImage(this.img);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PhotoView(
        imageProvider: AssetImage(
          'assets/images/' + img,
        ),
      ),
    );
  }
}
