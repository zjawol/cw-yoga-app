import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/steps_provider.dart';

import '../widgets/step_image.dart';
import '../widgets/step_details.dart';
import '../widgets/step_breathing.dart';
import '../widgets/step_benefits.dart';
import '../widgets/bottom_nav_bar.dart';

class YogaStepsPage extends StatelessWidget {
  const YogaStepsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final poses = Provider.of<Steps>(context);
    final pose = poses.getStepById();
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoga poses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          )
        ],
      ),
      body: OrientationBuilder(builder: (
        contex,
        orientation,
      ) {
        return Center(
          child: Column(
            children: [
              StepImage(pose.image),
              // Text("TEST"),
              Visibility(
                child: StepDetails(pose.details),
                visible: poses.displayDetails,
              ),
              Visibility(
                child: StepBreathing(pose.breathing),
                visible: poses.displayBreathing,
              ),
              Visibility(
                child: StepBenefits(pose.benefits),
                visible:
                    pose.benefits.isNotEmpty ? poses.displayBenefits : false,
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
