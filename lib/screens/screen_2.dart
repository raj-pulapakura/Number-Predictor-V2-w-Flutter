import 'package:app/screens/bases/landscape_play_screen.dart';
import 'package:app/screens/bases/portrait_play_screen.dart';
import 'package:app/screens/screen_1.dart';
import 'package:app/screens/screen_3.dart';
import "package:flutter/material.dart";

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  static const route = "/screen2";
  static const screenCode = "screen_2";

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const PortraitPlayScreen(
            screenId: 2,
            previousRoute: Screen1.route,
            nextRoute: Screen3.route,
            titleText: "Second Slide",
          );
        } else {
          return const LandscapePlayScreen(
            screenId: 2,
            previousRoute: Screen1.route,
            nextRoute: Screen3.route,
            titleText: "Second Slide",
          );
        }
      },
    );
  }
}
