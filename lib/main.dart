import 'package:app/providers/game_provider.dart';
import 'package:app/screens/calculating.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/pre_game.dart';
import 'package:app/screens/results.dart';
import 'package:app/screens/rules.dart';
import 'package:app/screens/screen_1.dart';
import 'package:app/screens/screen_2.dart';
import 'package:app/screens/screen_3.dart';
import 'package:app/screens/screen_4.dart';
import 'package:app/screens/screen_5.dart';
import 'package:app/screens/testing.dart';
import 'package:app/screens/whoops.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.yellow, // navigation bar color
      statusBarColor: Colors.yellow, // status bar color
    ),
  );

  runApp(
    ChangeNotifierProvider.value(
      child: const MyApp(),
      value: GameProvider(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Number Predictor',
      theme: ThemeData(
        fontFamily: "Lilitaone",
        primaryColor: const Color.fromARGB(225, 119, 0, 255),
      ),
      home: const HomeScreen(),
      routes: {
        HomeScreen.route: (_) => const HomeScreen(),
        RulesScreen.route: (_) => const RulesScreen(),
        PreGameScreen.route: (_) => const PreGameScreen(),
        Screen1.route: (_) => const Screen1(),
        Screen2.route: (_) => const Screen2(),
        Screen3.route: (_) => const Screen3(),
        Screen4.route: (_) => const Screen4(),
        Screen5.route: (_) => const Screen5(),
        Calculating.route: (_) => const Calculating(),
        ResultsScreen.route: (_) => const ResultsScreen(),
        Whoops.route: (_) => const Whoops(),
        TestingScreen.route: (_) => const TestingScreen(),
      },
    );
  }
}
