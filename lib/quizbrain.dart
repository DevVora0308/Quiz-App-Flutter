import 'qna.dart';

class QuizBrain {
  int _qnumb = 0;
  List<QnA> _questionBank = [
    QnA("Everything in Flutter is a Widget ?", true),
    QnA("Flutter is based on JAVA Programming ?", false),
    QnA("Widgets in Flutter are classified as stateful and stateless ?", true),
    QnA("Flutter uses Dart language ?", true),
    QnA("Widgets in Flutter cannot be customized ?", false),
  ];

  void nextQuestion() {
    if (_qnumb < _questionBank.length - 1) {
      _qnumb++;
    }
  }

  bool isFinished() {
    if (_qnumb >= _questionBank.length -1) {
      return true;
    } else {
      return false;
    }
  }

  String getQuestion() {
    return _questionBank[_qnumb].question;
  }

  bool getAnswer() {
    return _questionBank[_qnumb].answer;
  }

  void reset() {
    _qnumb = 0;
  }

}