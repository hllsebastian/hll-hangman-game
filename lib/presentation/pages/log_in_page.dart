import 'package:flutter/material.dart';
import 'package:hangman_game/core/constants/text_consts.dart';
import 'package:hangman_game/presentation/pages/instructions_page.dart';

class HangmanLogin extends StatelessWidget {
  const HangmanLogin({super.key});

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 90);
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          spacer,
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(TextConst.hangmanGame,
                style: TextStyle(color: Colors.black)),
          ),
          spacer,
          _Login(screenSize: screenSize),
          spacer,
          const Text(TextConst.newInGame),
          TextButton(
            child: const Text(TextConst.createAccount),
            onPressed: () => {},
          ),
          const Text(TextConst.orsignIn),
          _OrLoginWith(screenSize: screenSize),
        ]),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            width: screenSize.width * 0.7,
            height: screenSize.height * 0.05,
            child: const TextField(
              decoration: InputDecoration(
                labelText: TextConst.insertUser,
                // label: Text(
                //   'User',
                //   style: TextStyle(
                //     fontSize: 30,
                //     color: Colors.black,
                //   ),
                // ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: screenSize.width * 0.7,
            height: screenSize.height * 0.05,
            child: const TextField(
              decoration: InputDecoration(
                labelText: TextConst.insertPassword,
                // label: Text(
                //   'User',
                //   style: TextStyle(
                //     fontSize: 30,
                //     color: Colors.black,
                //   ),
                // ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          CircleAvatar(
            backgroundColor: Colors.black12,
            radius: 30,
            child: TextButton(
              child: const Text(
                'Go!',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const InstructionsPage()),
                (route) => false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrLoginWith extends StatelessWidget {
  const _OrLoginWith({required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.zero,
                child: Image(
                    width: 0.2 * screenSize.width,
                    height: 0.1 * screenSize.height,
                    image:
                        const AssetImage('assets/images/fbook_icon_black.png')),
              )),
          InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.zero,
                child: Image(
                    width: 0.2 * screenSize.width,
                    height: 0.1 * screenSize.height,
                    image:
                        const AssetImage('assets/images/gmail_icon_white.jpg')),
              )),
        ],
      ),
    );
  }
}
