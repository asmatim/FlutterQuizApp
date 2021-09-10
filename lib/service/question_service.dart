import 'package:quiz_tp/mock/question_mock.dart';
import 'package:quiz_tp/model/question.dart';

class QuestionService {
  Future<List<Question>> getQuestions() {
    return QuestionMockRepository.getQuestions();
  }
}
