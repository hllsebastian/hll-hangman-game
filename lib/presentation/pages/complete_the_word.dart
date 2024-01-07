import 'package:flutter/material.dart';
import 'package:hangman_game/core/constants/text_consts.dart';

class CompleteTheWord extends StatelessWidget {
  const CompleteTheWord({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context);
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Title(),
          _WordLine(),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        TextConst.hangmanOrNot,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}

class _WordLine extends StatelessWidget {
  const _WordLine();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 50, width: 50, child: TextField()),
        SizedBox(width: 10),
        SizedBox(height: 50, width: 50, child: TextField()),
        SizedBox(width: 10),
        SizedBox(height: 50, width: 50, child: TextField()),
      ],
    );
  }
}
