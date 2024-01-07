import 'dart:math';
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

class _WordLine extends StatefulWidget {
  const _WordLine();

  @override
  State<_WordLine> createState() => _WordLineState();
}

class _WordLineState extends State<_WordLine> {
  final List<String> words = [
    'FLUTTER',
    'DART',
    'WIDGET',
    'HANGMAN',
    'DEVELOPER',
  ];

  late String randomWord;
  late String displayWord;
  late int maxAttempts = 6;
  late int attemptsLeft;
  late List<String> guessedLetters;
  Color? buttonColor;

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame([bool buttonPressed = false]) {
    Random random = Random();
    int randomIndex = random.nextInt(words.length);
    randomWord = words[randomIndex];
    displayWord = '_ ' * randomWord.length;
    attemptsLeft = maxAttempts;
    guessedLetters = [];
    print(randomWord.toUpperCase() ?? 'ALOHAAAA');
    if (buttonPressed) updateDisplayWord();
  }

  void guessLetter(String letter) {
    setState(() {
      if (!guessedLetters.contains(letter)) {
        guessedLetters.add(letter);
        if (!randomWord.contains(letter)) {
          attemptsLeft--;
        }
        updateDisplayWord();
      }
    });
  }

  void updateDisplayWord() {
    String updatedDisplayWord = '';
    for (int i = 0; i < randomWord.length; i++) {
      String letter = randomWord[i];
      if (guessedLetters.contains(letter)) {
        updatedDisplayWord += '$letter ';
      } else {
        updatedDisplayWord += '_ ';
      }
    }
    setState(() {
      displayWord = updatedDisplayWord;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Word to Guess:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              displayWord,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              '${TextConst.attemptsLeft}: $attemptsLeft',
              style: const TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 6,
                children: List.generate(26, (index) {
                  String letter =
                      String.fromCharCode('A'.codeUnitAt(0) + index);
                  bool isLetterGuessed = guessedLetters.contains(letter);
                  bool isWordLetter = randomWord.contains(letter);

                  Color? buttonColor() {
                    if (isLetterGuessed && !isWordLetter) return Colors.black26;
                    if (isWordLetter && isLetterGuessed) return Colors.green;
                    return null;
                  }

                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor()),
                    onPressed: () {
                      if (!isLetterGuessed) {
                        guessLetter(letter);
                      }
                    },
                    child: Text(letter),
                  );
                }),
              ),
            ),
            ElevatedButton(
              onPressed: () => startNewGame(true),
              child: const Text(TextConst.startNewGame),
            ),
          ],
        ),
      ),
    );
  }
}
