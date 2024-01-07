import 'package:flutter/material.dart';
import 'package:hangman_game/core/constants/text_consts.dart';
import 'package:hangman_game/presentation/pages/complete_the_word.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Instructions(),
            _StartButton(),
          ],
        ),
      ),
    );
  }
}

class _Instructions extends StatelessWidget {
  const _Instructions();
  @override
  Widget build(BuildContext context) {
    const spaceText = SizedBox(height: 30);
    return const Column(
      children: [
        Text(
          TextConst.instructions,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 40),
        Text(
          TextConst.instructions1,
          textAlign: TextAlign.center,
          style: TextStyle(/* fontFamily: 'Roboto'*/ fontSize: 20),
        ),
        spaceText,
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            TextConst.instructions2,
            textAlign: TextAlign.center,
            style: TextStyle(/* fontFamily: 'Roboto'*/ fontSize: 20),
          ),
        ),
        spaceText,
        Text(
          TextConst.instructions3,
          textAlign: TextAlign.center,
          style: TextStyle(/* fontFamily: 'Roboto'*/ fontSize: 20),
        ),
        SizedBox(height: 60),
      ],
    );
  }
}

class _StartButton extends StatelessWidget {
  const _StartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black54,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(20, 30)))),
      child: const Text(TextConst.pressToStar),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CompleteTheWord()));
      },
    );
  }
}
