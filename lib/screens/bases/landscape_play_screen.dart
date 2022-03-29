import 'package:app/providers/game_provider.dart';
import 'package:app/screens/home.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/number.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class LandscapePlayScreen extends StatelessWidget {
  final int screenId;
  final String previousRoute;
  final String nextRoute;
  final String titleText;

  const LandscapePlayScreen({
    Key? key,
    required this.screenId,
    required this.previousRoute,
    required this.nextRoute,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    final values = gameProvider.constants[screenId]!["values"] as List;
    final increaseAmount =
        gameProvider.constants[screenId]!["increaseAmount"] as int;

    return Scaffold(
      floatingActionButton: buildFloatingActionButtonRow(context, gameProvider),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.yellow,
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.125,
                  child: Button(
                    text: "Yes",
                    onPressed: () {
                      gameProvider.increaseTally(increaseAmount);
                      gameProvider.yesNoStack.push(YesNoStack.yes);
                      Navigator.pushReplacementNamed(context, nextRoute);
                    },
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTitle(),
                  const SizedBox(height: 15),
                  buildQuestion(),
                  const SizedBox(height: 20),
                  buildNumberGrid(context, values),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.125,
                  child: Button(
                    text: "No",
                    onPressed: () {
                      gameProvider.yesNoStack.push(YesNoStack.no);
                      Navigator.pushReplacementNamed(context, nextRoute);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFloatingActionButtonRow(
    BuildContext context,
    GameProvider gameProvider,
  ) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.arrow_back),
            heroTag: "back",
            onPressed: () {
              if (screenId != 1) {
                if (gameProvider.yesNoStack.pop() == YesNoStack.yes) {
                  final decreaseAmount = gameProvider
                      .constants[screenId - 1]!["increaseAmount"] as int;
                  gameProvider.decreaseTally(decreaseAmount);
                }
              }
              Navigator.pushReplacementNamed(context, previousRoute);
            },
            backgroundColor: Theme.of(context).primaryColor,
          ),
          FloatingActionButton(
            child: const Icon(Icons.home),
            heroTag: "home",
            onPressed: () {
              gameProvider.clear();
              Navigator.pushReplacementNamed(context, HomeScreen.route);
            },
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      titleText,
      style: const TextStyle(fontSize: 40),
    );
  }

  Widget buildQuestion() {
    return const Text(
      "Do you see your number?",
      style: TextStyle(fontSize: 20),
    );
  }

  Widget buildNumberGrid(BuildContext context, List values) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: GridView.count(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(
          values.length,
          (int index) => Number(number: values[index] as int),
        ),
      ),
    );
  }
}
