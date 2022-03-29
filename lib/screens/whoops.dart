import 'package:app/providers/game_provider.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/pre_game.dart';
import 'package:app/widgets/button.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class Whoops extends StatelessWidget {
  const Whoops({Key? key}) : super(key: key);

  static const route = "/whoops";

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    print(gameProvider.tally);

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Column(
                children: const [
                  Text(
                    "Hmmmmm...",
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Are you sure you chose a number from 1 to 30?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Just kidding. We know you didn't. Nice try.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Button(
                    text: "Play Again",
                    buttonColor: ButtonColor.primary,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, PreGameScreen.route);
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
