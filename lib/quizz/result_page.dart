import 'package:english_learning_app/quizz/quiz_page.dart';
import 'package:english_learning_app/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ResultPage({Key? key, required this.score, required this.totalQuestions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message;
    if (score >= 8) {
      message = "Congratulations!";
    } else if (score >= 5) {
      message = "Good, keep it up!";
    } else {
      message = "Sorry, try again.";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Results"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple[200]!, Colors.purple[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Stylish Result Message
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        message,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Your score:",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        "$score out of $totalQuestions",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                // Stylish Try Again Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.purpleAccent,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    textStyle: TextStyle(fontSize: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Navigate back to quiz
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (builder) => QuizPage()),
                    );
                  },
                  child: Text("Try Again"),
                ),
                SizedBox(height: 10),

                // Stylish Go to Home Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.purpleAccent,
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    textStyle: TextStyle(fontSize: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to home
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (builder) => DashboardScreen()),
                    );
                  },
                  child: Text("Go to Home"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
