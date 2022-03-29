import 'package:app/providers/game_provider.dart';
import 'package:app/screens/screen_1.dart';
import 'package:app/widgets/button.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class PreGameScreen extends StatelessWidget {
  const PreGameScreen({Key? key}) : super(key: key);

  static const route = "/pre-game";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Think of any number from 1 to 30.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Button(
                    text: "Let's Go",
                    buttonColor: ButtonColor.primary,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Screen1.route);
                      Provider.of<GameProvider>(context, listen: false).clear();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
