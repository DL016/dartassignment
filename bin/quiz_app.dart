import 'package:dart_application/quiz_func.dart';

void main() {
  final questions = [
    {'question': 'Who is the creator of Jojo ?', 'answer': 'Horihiko Araki'},
    {'question': 'What is 7 + 7?', 'answer': '14'},
    {'question': 'What do I love the most?', 'answer': 'Nothing'},
    {
      'question': 'What is the name of Dio Brando"s Stand ',
      'answer': 'THE WORLD',
    },
    {'question': 'How many Jojo parts are there?', 'answer': '9'},
  ];

  runQuiz(questions);
}
