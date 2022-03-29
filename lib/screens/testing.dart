import "package:flutter/material.dart";
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({Key? key}) : super(key: key);

  static const route = "/testing";

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _sequenceAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);

    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: ColorTween(begin: Colors.red, end: Colors.blue),
          from: const Duration(seconds: 0),
          to: const Duration(seconds: 2),
          tag: "1color",
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 200, end: 100),
          from: const Duration(seconds: 1),
          to: const Duration(seconds: 3),
          tag: "1width",
        )
        .addAnimatable(
            animatable: ColorTween(begin: Colors.green, end: Colors.orange),
            from: const Duration(seconds: 1),
            to: const Duration(seconds: 3),
            tag: "2color")
        .addAnimatable(
            animatable: Tween<double>(begin: 100, end: 300),
            from: const Duration(seconds: 2),
            to: const Duration(seconds: 4),
            tag: "2width")
        .animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, widget) {
                return Container(
                  width: _sequenceAnimation["1width"].value,
                  height: 200,
                  color: _sequenceAnimation["1color"].value,
                );
              },
            ),
            const SizedBox(height: 30),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, widget) {
                return Container(
                  width: _sequenceAnimation["2width"].value,
                  height: 100,
                  color: _sequenceAnimation["2color"].value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
