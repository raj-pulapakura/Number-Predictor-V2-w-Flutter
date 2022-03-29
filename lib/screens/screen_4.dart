import 'package:app/screens/bases/landscape_play_screen.dart';
import 'package:app/screens/bases/portrait_play_screen.dart';
import 'package:app/screens/screen_3.dart';
import 'package:app/screens/screen_5.dart';
import "package:flutter/material.dart";

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  static const route = "/screen4";
  static const screenCode = "screen_4";

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const PortraitPlayScreen(
            screenId: 4,
            previousRoute: Screen3.route,
            nextRoute: Screen5.route,
            titleText: "Fourth Slide",
          );
        } else {
          return const LandscapePlayScreen(
            screenId: 4,
            previousRoute: Screen3.route,
            nextRoute: Screen5.route,
            titleText: "Fourth Slide",
          );
        }
      },
    );
  }
}
