import 'dart:math';

import 'package:app/providers/game_provider.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/pre_game.dart';
import 'package:app/widgets/button.dart';
import 'package:confetti/confetti.dart';
import "package:flutter/material.dart";
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:provider/provider.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  static const route = "/results";

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _sequenceAnimation;
  late ConfettiController _confettiController;
  bool _mainAnimationDone = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);

    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 200, end: 100),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 1000),
          tag: "width",
          curve: Curves.easeInOut,
        )
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 1000),
            to: const Duration(milliseconds: 1500),
            tag: "button_opacity")
        .animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      setState(() {
        _mainAnimationDone = true;
      });
    });

    _confettiController = ConfettiController();

    _confettiController.play();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? widget) {
                      return Container(
                        width: _sequenceAnimation["width"].value,
                        height: _sequenceAnimation["width"].value,
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            gameProvider.tally.toString(),
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Opacity(
                              opacity:
                                  _sequenceAnimation["button_opacity"].value,
                              child: Button(
                                text: "Play Again",
                                buttonColor: ButtonColor.primary,
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, PreGameScreen.route);
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Opacity(
                              opacity:
                                  _sequenceAnimation["button_opacity"].value,
                              child: Button(
                                  text: "Home",
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, HomeScreen.route);
                                  }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_mainAnimationDone)
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                emissionFrequency: 0.025,
                numberOfParticles: 45,
                blastDirection: pi / 2,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: true,
                colors: const [
                  Colors.red,
                  Colors.purple,
                  Colors.orange,
                  Colors.blue,
                  Colors.green,
                ],
              ),
            ),
          if (_mainAnimationDone)
            Align(
              alignment: Alignment.centerLeft,
              child: ConfettiWidget(
                confettiController: _confettiController,
                emissionFrequency: 0.025,
                numberOfParticles: 45,
                blastDirection: 0,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: true,
                colors: const [
                  Colors.red,
                  Colors.purple,
                  Colors.orange,
                  Colors.blue,
                  Colors.green,
                ],
              ),
            ),
          if (_mainAnimationDone)
            Align(
              alignment: Alignment.centerRight,
              child: ConfettiWidget(
                confettiController: _confettiController,
                emissionFrequency: 0.025,
                numberOfParticles: 45,
                blastDirection: pi,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: true,
                colors: const [
                  Colors.red,
                  Colors.purple,
                  Colors.orange,
                  Colors.blue,
                  Colors.green,
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return const Text(
      "Your number is...",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 30),
    );
  }

  Widget buildActionButtons(
    BuildContext context,
    GameProvider gameProvider,
    Orientation orientation,
  ) {
    if (orientation == Orientation.portrait) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Button(
            text: "Play Again",
            buttonColor: ButtonColor.primary,
            onPressed: () {
              Navigator.pushReplacementNamed(context, PreGameScreen.route);
              gameProvider.clear();
            },
          ),
          const SizedBox(height: 10),
          Button(
            text: "Home",
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomeScreen.route);
              gameProvider.clear();
            },
          ),
        ],
      );
    } else {
      return FractionallySizedBox(
        widthFactor: 0.5,
        child: Row(
          children: [
            Expanded(
              child: Button(
                text: "Play Again",
                buttonColor: ButtonColor.primary,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, PreGameScreen.route);
                  gameProvider.clear();
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Button(
                text: "Home",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.route);
                  gameProvider.clear();
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}
