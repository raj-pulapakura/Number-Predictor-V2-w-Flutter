import 'package:app/screens/bases/landscape_play_screen.dart';
import 'package:app/screens/bases/portrait_play_screen.dart';
import 'package:app/screens/calculating.dart';
import 'package:app/screens/screen_4.dart';
import "package:flutter/material.dart";

class Screen5 extends StatelessWidget {
  const Screen5({Key? key}) : super(key: key);

  static const route = "/screen5";
  static const screenCode = "screen_5";

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const PortraitPlayScreen(
            screenId: 5,
            previousRoute: Screen4.route,
            nextRoute: Calculating.route,
            titleText: "Fifth Slide",
          );
        } else {
          return const LandscapePlayScreen(
            screenId: 5,
            previousRoute: Screen4.route,
            nextRoute: Calculating.route,
            titleText: "Fifth Slide",
          );
        }
      },
    );
  }
}
