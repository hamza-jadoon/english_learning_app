import 'package:english_learning_app/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'edit_profile.dart'; // Import EditProfileScreen

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  String? _phoneNumber;

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    _user = _auth.currentUser;
    if (_user != null) {
      try {
        DocumentSnapshot snapshot = await _firestore.collection('users').doc(_user!.uid).get();
        if (snapshot.exists) {
          Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
          if (data != null) {
            setState(() {
              _phoneNumber = data['phoneNumber']; // Get phone number from Firestore
            });
          }
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }
  }

  Future<void> _logout() async {
    await _auth.signOut();
    Navigator.of(context).pushReplacementNamed('/login'); // Adjust the route name accordingly
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Profile"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
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
                _user?.displayName ?? 'User Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                _user?.email ?? 'user@example.com',
                style: TextStyle(fontSize: 20, color: Colors.grey[600]),
              ),
              SizedBox(height: 10),
              // Display phone number
              Text(
                _phoneNumber ?? 'Phone Number', // Updated here
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Navigate to Edit Profile screen
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileScreen()),
                  );
                  // After coming back, refresh user data
                  _getUserInfo();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                ),
                child: Text('Edit Profile'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => LoginScreen()));
                }, onLongPress: _logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                ),
                child: Text('LogOut'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
