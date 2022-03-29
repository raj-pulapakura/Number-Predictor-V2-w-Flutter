import 'package:app/screens/bases/landscape_play_screen.dart';
import 'package:app/screens/bases/portrait_play_screen.dart';
import 'package:app/screens/pre_game.dart';
import 'package:app/screens/screen_2.dart';
import "package:flutter/material.dart";

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  static const route = "/screen1";

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const PortraitPlayScreen(
            screenId: 1,
            previousRoute: PreGameScreen.route,
            nextRoute: Screen2.route,
            titleText: "First Slide",
          );
        } else {
          return const LandscapePlayScreen(
            screenId: 1,
            previousRoute: PreGameScreen.route,
            nextRoute: Screen2.route,
            titleText: "First Slide",
          );
        }
      },
    );
  }
}
