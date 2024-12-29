import 'package:flutter/material.dart';
import 'lesson_data.dart';
import 'lesson_detail.dart';

class LessonListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background color
      appBar: AppBar(
        title: Text(
          'Lessons',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4.0, // Shadow for the AppBar
        backgroundColor: Colors.purple, // Stylish AppBar color
      ),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessonDetailScreen(lesson: lesson),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 8.0, // Adds shadow effect
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple[100]!, Colors.purple[50]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    title: Text(
                      lesson.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.deepPurple,
                      ),
                    ),
                    subtitle: Text(
                      lesson.description,
                      style: TextStyle(fontSize: 14.0, color: Colors.black54),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.deepPurpleAccent,
                      size: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
