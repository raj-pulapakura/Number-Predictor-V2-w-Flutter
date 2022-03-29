import 'package:app/providers/game_provider.dart';
import 'package:app/screens/results.dart';
import 'package:app/screens/testing.dart';
import 'package:app/screens/whoops.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class Calculating extends StatefulWidget {
  const Calculating({Key? key}) : super(key: key);

  static const route = "/calculating";

  @override
  State<Calculating> createState() => _CalculatingState();
}

class _CalculatingState extends State<Calculating> {
  @override
  void initState() {
    super.initState();

    final tally = Provider.of<GameProvider>(context, listen: false).tally;

    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        if (tally < 1 || tally > 30) {
          Navigator.pushReplacementNamed(context, Whoops.route);
        } else {
          Navigator.pushReplacementNamed(context, ResultsScreen.route);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Text(
          "Calculating...",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
