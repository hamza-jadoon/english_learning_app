import 'package:english_learning_app/quizz/quiz_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'lesson_model.dart';

class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;

  LessonDetailScreen({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lesson Description
              Text(
                lesson.description,
                style: TextStyle(color:Colors.white,
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Lesson Content
              Text(
                lesson.content,
                style: TextStyle(color:Colors.white,fontSize: 18),
              ),
              SizedBox(height: 20),

              // Lesson Keywords
              Text(
                "Keywords: ${lesson.keywords.join(', ')}",
                style: TextStyle(color:Colors.white,fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 10),

              // Lesson Duration
              Text(
                "Estimated Duration: ${lesson.duration} minutes",
                style: TextStyle(color:Colors.white,fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 10),

              // Lesson Level
              Text(
                "Level: ${lesson.level}",
                style: TextStyle(color:Colors.white,fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),

              // Lesson Examples
              Text(
                "Examples:",
                style: TextStyle(color:Colors.white,fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ...lesson.examples.map((example) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "- $example",
                  style: TextStyle(color:Colors.white,fontSize: 16),
                ),
              )),
              SizedBox(height: 20),

              // Lesson References
              Text(
                "References:",
                style: TextStyle(color:Colors.white,fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ...lesson.references.map((reference) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "- $reference",
                  style: TextStyle(color:Colors.white,fontSize: 16),
                ),
              )),
              SizedBox(height: 20),

              // Take Quiz Button
              lesson.quizUrl.isNotEmpty
                  ? Center(
                    child: ElevatedButton(
                                    onPressed: () {
                    // Handle quiz URL navigation
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizPage(), // Replace with appropriate quiz handling
                      ),
                    );
                                    },
                                    child: Text('Take Quiz'),
                                  ),
                  )
                  : Container(), // No quiz available if quizUrl is empty
            ],
          ),
        ),
      ),
    );
  }
}
