import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/steps_provider.dart';

import './screens/my_home_page.dart';
import './screens/about_us_page.dart';
import './screens/creadits_page.dart';
import './screens/yoga_steps_page.dart';
import './screens/settings_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Steps>(
        create: (_) => Steps(),
      )
    ],
    child: SuryaApp(),
  ));
}

class SuryaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context.read<Steps>().fetchData;
    final steps = Provider.of<Steps>(context);
    context.read<Steps>().fetchData;
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/about': (context) => AboutUsPage(),
        '/credits': (context) => CreditsPage(),
        '/steps': (context) => YogaStepsPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
