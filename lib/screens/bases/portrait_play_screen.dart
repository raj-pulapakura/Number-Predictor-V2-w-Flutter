import 'package:app/providers/game_provider.dart';
import 'package:app/screens/home.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/number.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class PortraitPlayScreen extends StatelessWidget {
  final int screenId;
  final String previousRoute;
  final String nextRoute;
  final String titleText;

  const PortraitPlayScreen({
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
      // floatingActionButton: buildFloatingActionButtonRow(context, gameProvider),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.yellow,
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTitle(),
            const SizedBox(height: 25),
            buildNumberGrid(values),
            const SizedBox(height: 30),
            buildQuestion(),
            const SizedBox(height: 30),
            buildActionButtons(context, gameProvider, increaseAmount)
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

  Widget buildNumberGrid(List values) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: GridView.count(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(
          values.length,
          (int index) => Number(number: values[index] as int),
        ),
      ),
    );
  }

  Widget buildQuestion() {
    return Text(
      "Do you see your number?",
      style: TextStyle(fontSize: 20),
    );
  }

  Widget buildActionButtons(
    BuildContext context,
    GameProvider gameProvider,
    int increaseAmount,
  ) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Button(
              text: "Yes",
              onPressed: () {
                gameProvider.increaseTally(increaseAmount);
                gameProvider.yesNoStack.push(YesNoStack.yes);
                Navigator.pushReplacementNamed(context, nextRoute);
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Button(
              text: "No",
              onPressed: () {
                gameProvider.yesNoStack.push(YesNoStack.no);
                Navigator.pushReplacementNamed(context, nextRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}
