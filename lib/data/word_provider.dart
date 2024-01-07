import 'package:flutter/material.dart';

class WordProvider extends InheritedWidget {
  const WordProvider({super.key, required this.child}) : super(child: child);

  final Widget child;

  static WordProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WordProvider>();
  }

  @override
  bool updateShouldNotify(WordProvider oldWidget) {
    return true;
  }
}
