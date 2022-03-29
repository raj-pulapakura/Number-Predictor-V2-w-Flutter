import 'package:app/screens/pre_game.dart';
import 'package:app/screens/rules.dart';
import 'package:app/widgets/button.dart';
import "package:flutter/material.dart";
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const route = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _sequenceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: const Duration(milliseconds: 200),
          to: const Duration(milliseconds: 1000),
          tag: "button_opacity",
        )
        .animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...buildTitle(orientation),
                const SizedBox(height: 10),
                const Text(
                  "P-Bros Dev.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 40),
                buildActionButtons(context, orientation),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> buildTitle(Orientation orientation) {
    if (orientation == Orientation.portrait) {
      return [
        const Text(
          "Number",
          style: TextStyle(fontSize: 45),
        ),
        const Text(
          "Predictor",
          style: TextStyle(fontSize: 45),
        ),
      ];
    } else {
      return [
        const Text(
          "Number Predictor",
          style: TextStyle(fontSize: 45),
        ),
      ];
    }
  }

  Widget buildActionButtons(BuildContext context, Orientation orientation) {
    final playButton = AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _sequenceAnimation["button_opacity"].value,
          child: Button(
            text: "Play",
            buttonColor: ButtonColor.primary,
            onPressed: () {
              Navigator.pushReplacementNamed(context, PreGameScreen.route);
            },
          ),
        );
      },
    );

    final rulesButton = AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _sequenceAnimation["button_opacity"].value,
          child: Button(
            text: "Rules",
            onPressed: () {
              Navigator.pushReplacementNamed(context, RulesScreen.route);
            },
          ),
        );
      },
    );

    return FractionallySizedBox(
      widthFactor: 0.5,
      child: orientation == Orientation.portrait
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                playButton,
                const SizedBox(height: 10),
                rulesButton,
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: playButton,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: rulesButton,
                ),
              ],
            ),
    );
  }
}
