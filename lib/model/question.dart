import 'package:flutter/cupertino.dart';

@immutable
class Question {
  // question / answer sont accessibles en lecture et non modifiable (final et public)
  // donc la classe est immutable, les deux attirbuts définis au niveau du constructeur
  final String question;
  final bool answer;

  // constructor
  const Question({required this.question, required this.answer});
}
