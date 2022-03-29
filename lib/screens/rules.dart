import 'package:app/widgets/button.dart';
import "package:flutter/material.dart";
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({Key? key}) : super(key: key);

  static const route = "/rules";

  static const rules = [
    "1. Think of a number from 1 to 30.",
    "2. Remember this number.",
    "3. You will be shown 5 slides.",
    "4. On each slide, click YES if your number is there, or click NO if it is not.",
    "5. At the end of the five slides, your number will be magically guessed!",
  ];

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen>
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
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 500),
          tag: "rule_1",
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: const Duration(milliseconds: 250),
          to: const Duration(milliseconds: 750),
          tag: "rule_2",
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: const Duration(milliseconds: 500),
          to: const Duration(milliseconds: 1000),
          tag: "rule_3",
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: const Duration(milliseconds: 750),
          to: const Duration(milliseconds: 1250),
          tag: "rule_4",
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: const Duration(milliseconds: 1000),
          to: const Duration(milliseconds: 1500),
          tag: "rule_5",
        )
        .animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.check),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/home");
            },
          ),
          floatingActionButtonLocation: orientation == Orientation.portrait
              ? FloatingActionButtonLocation.centerFloat
              : FloatingActionButtonLocation.endTop,
          backgroundColor: Colors.yellow,
          body: Container(
            margin: const EdgeInsets.only(top: 50, left: 20),
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "It's pretty simple.",
                      style: TextStyle(fontSize: 35),
                    ),
                    const SizedBox(height: 18),
                    ...RulesScreen.rules.map((text) {
                      return buildRuleText(
                        text,
                        RulesScreen.rules.indexOf(text),
                      );
                    }),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildRuleText(String text, int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _sequenceAnimation["rule_" + (index + 1).toString()].value,
          child: Container(
            margin: EdgeInsets.only(
                bottom: index == RulesScreen.rules.length - 1 ? 0 : 15),
            child: Text(
              text,
              style: const TextStyle(fontSize: 19),
            ),
          ),
        );
      },
    );
  }
}
