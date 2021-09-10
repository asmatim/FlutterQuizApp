import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quiz_tp/model/question.dart';

class QuestionMockRepository {
  static Future<List<Question>> getQuestions() async {
    String jsonContent = await _readJsonData();

    List<dynamic> questionsData = jsonDecode(jsonContent);
    List<Question> questions = [];
    for (var question in questionsData) {
      questions.add(new Question(
          question: question['question'], answer: question['answer']));
    }
    return Future.value(questions);
  }

  static Future<String> _readJsonData() async {
    try {
      final contents =
          await rootBundle.loadString('assets/data/questions.json');

      return contents;
    } catch (e) {
      print(e);
      return '';
    }
  }
}
