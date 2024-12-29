import 'package:english_learning_app/quizz/quiz_question.dart';
import 'package:english_learning_app/quizz/result_page.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int currentQuestionIndex = 0;
  int score = 0;

  void answerQuestion(String selectedAnswer) {
    if (selectedAnswer == quizQuestions[currentQuestionIndex].correctAnswer) {
      score++;
    }
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= quizQuestions.length) {
      return ResultPage(score: score, totalQuestions: quizQuestions.length);
    }

    final question = quizQuestions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple[300]!, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Reminder text
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.amber, width: 2),
              ),
              child: Text(
                "Please answer all questions to complete the quiz!",
                style: TextStyle(fontSize: 16, color: Colors.brown),
                textAlign: TextAlign.center,
              ),
            ),
            // Question text
            Text(
              question.question,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            // Answer buttons
            Expanded(
              child: ListView(
                children: question.options.map((answer) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Button color
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // Rounded corners
                          side: BorderSide(color: Colors.deepPurple), // Border color
                        ),
                      ),
                      onPressed: () => answerQuestion(answer),
                      child: Text(
                        answer,
                        style: TextStyle(color: Colors.deepPurple), // Button text color
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Progress indicator
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Question ${currentQuestionIndex + 1} of ${quizQuestions.length}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
