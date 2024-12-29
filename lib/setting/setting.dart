import 'package:english_learning_app/profilee/profile_screen.dart';
import 'package:english_learning_app/screen/dashboard_screen.dart';
import 'package:english_learning_app/setting/setting_category.dart';
import 'package:english_learning_app/setting/user_profile_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../authentication/sign_up_screen.dart';

class SettingsScreen extends StatelessWidget {

  User? _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [

            UserProfileSection(),
            SizedBox(height: 20),

            SettingsCategory(title: "Account Settings"),
            SettingsCategory(title: "Notifications"),
            SettingsCategory(title: "Language Preferences"),
            SettingsCategory(title: "Themes"),
            SettingsCategory(title: "About the App"),
            SizedBox(height: 30),
            // Action Buttons
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
                child: Text('Save Changes'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenSignup()),
                  );
                },
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


