import 'package:english_learning_app/authentication/login_screen.dart';
import 'package:english_learning_app/dailylesson/lesson_list.dart';
import 'package:english_learning_app/profilee/profile_screen.dart';
import 'package:english_learning_app/quizz/quiz_page.dart';
import 'package:english_learning_app/setting/setting.dart';
import 'package:english_learning_app/word_meaning/translate_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  User? _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scaffoldKey.currentState?.openEndDrawer();
                });
              },
              child: CircleAvatar(
                // Add profile picture
                radius: 20,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: 240,
        backgroundColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 60),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepPurpleAccent,
                child: Text(
                  _user?.displayName?.substring(0, 1) ?? 'U',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Text(
                _user?.displayName ?? 'Student Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              _buildDrawerItem(
                icon: Icons.person,
                title: 'Profile',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
              _buildDrawerItem(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen()));
                },
              ),
              _buildDrawerItem(
                icon: Icons.login,
                title: 'Logout',
                onTap: () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ), // You can add drawer i
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting and Progress Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello, User!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Keep up the great work!',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 6.0,
                  percent: 0.7, // Progress percentage
                  center: Text("70%",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  progressColor: Colors.blueAccent,
                ),
              ],
            ),
            SizedBox(height: 40),

            // Category Grid with Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildGridCard(
                    context: context,
                    icon: Icons.book,
                    title: 'Daily Lessons',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LessonListScreen()));
                    },
                    color: Colors.purple, // Unique color for this card
                  ),
                  _buildGridCard(
                    context: context,
                    icon: Icons.quiz,
                    title: 'Quiz',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QuizPage()));
                    },
                    color: Colors.lightBlue, // Unique color for this card
                  ),
                  _buildGridCard(
                    context: context,
                    icon: Icons.add_card_sharp,
                    title: 'Words Meaning',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TranslationScreen()));
                    },
                    color: Colors.brown, // Unique color for this card
                  ),
                  _buildGridCard(
                    context: context,
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen()));
                    },
                    color:
                        Colors.deepPurpleAccent, // Unique color for this card
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Daily Challenge
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily Challenge:\nUse "serendipity" in a sentence!',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Start Challenge',
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.library_books, 'Courses', 1),
            _buildNavItem(Icons.star, 'Practice', 2),
            _buildNavItem(Icons.leaderboard, 'Leaderboard', 3),
            _buildNavItem(Icons.person, 'Profile', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blueAccent : Colors.black,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blueAccent : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// Helper method to create a grid card
Widget _buildGridCard({
  required BuildContext context,
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  required Color color,
}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 4,
    color: color.withOpacity(0.2),
    child: InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          SizedBox(height: 10),
          Text(title,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    ),
  );
}

Widget _buildDrawerItem(
    {required IconData icon,
    required String title,
    required VoidCallback onTap}) {
  return ListTile(
    leading: Icon(icon, color: Colors.deepPurple),
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
    ),
    onTap: onTap,
  );
}
