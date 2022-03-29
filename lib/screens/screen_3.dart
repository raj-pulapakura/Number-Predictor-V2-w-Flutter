import 'package:app/screens/bases/landscape_play_screen.dart';
import 'package:app/screens/bases/portrait_play_screen.dart';
import 'package:app/screens/screen_2.dart';
import 'package:app/screens/screen_4.dart';
import "package:flutter/material.dart";

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  static const route = "/screen3";
  static const screenCode = "screen_3";

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const PortraitPlayScreen(
            screenId: 3,
            previousRoute: Screen2.route,
            nextRoute: Screen4.route,
            titleText: "Third Slide",
          );
        } else {
          return const LandscapePlayScreen(
            screenId: 3,
            previousRoute: Screen2.route,
            nextRoute: Screen4.route,
            titleText: "Third Slide",
          );
        }
      },
    );
  }
}
