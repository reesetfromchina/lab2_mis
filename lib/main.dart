import 'package:flutter/material.dart';
import 'package:lab2_mis/screens/home.dart';
import 'screens/random_joke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2 Jokes App',
      initialRoute: '/',
      routes: {
        '/' : (context) => const HomeScreen(),
        '/randomJoke': (context) => const RandomJokeScreen(),
      },
    );
  }
}
