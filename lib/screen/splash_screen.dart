import 'dart:async';
import 'package:english_learning_app/authentication/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:english_learning_app/screen/dashboard_screen.dart'; // Import your Dashboard screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3)); // Duration for splash screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => DashboardScreen()), // Change to your main screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App logo
              Icon(
                Icons.school,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              // App name
              Text(
                'English Learning App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              // Tagline
              Text(
                'Learn English Fast & Easy',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
