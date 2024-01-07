import 'package:flutter/material.dart';
import 'package:hangman_game/presentation/pages/log_in_page.dart';

class HangmanGame extends StatelessWidget {
  const HangmanGame({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HangmanLogin(),
    );
  }
}
