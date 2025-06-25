import 'dart:io';

void runQuiz(List<Map<String, String>> questions) {
  int correctAnswers = 0;

  for (int i = 0; i < questions.length; i++) {
    print('\nQuestion ${i + 1}: ${questions[i]['question']}');
    String? userAnswer = stdin.readLineSync();

    if (userAnswer == null || userAnswer.trim().isEmpty) {
      print('Invalid input. Please answer the question');
      do {
        print('\nQuestion ${i + 1}: ${questions[i]['question']}');
        userAnswer = stdin.readLineSync();
      } while (userAnswer == null || userAnswer.trim().isEmpty);
    }

    if (userAnswer.trim().toLowerCase() ==
        questions[i]['answer']!.toLowerCase()) {
      print('Correct!');
      correctAnswers++;
    } else {
      print('Wrong. The correct answer is: ${questions[i]['answer']}');
    }
  }

  int totalQuestions = questions.length;
  double score = (correctAnswers / totalQuestions) * 100;

  print(
    '\nYou answered $correctAnswers out of $totalQuestions questions correctly.',
  );
  print('Your final score: ${score.toStringAsFixed(0)}%');
}
