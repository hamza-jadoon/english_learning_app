import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Firestore instance
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController(); // Phone number controller
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _nameController.text = _user?.displayName ?? '';
    _getUserProfileData(); // Fetch existing user data on init
  }

// Function to fetch existing user profile data
  Future<void> _getUserProfileData() async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('users').doc(_user?.uid).get();
      if (snapshot.exists) {
        // Explicitly cast the snapshot data to a Map<String, dynamic>
        Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          setState(() {
            _phoneNumberController.text = data['phoneNumber'] ?? ''; // Safely access phone number
          });
        }
      }
    } catch (e) {
      print('Error fetching user profile data: $e');
    }
  }


  Future<void> _updateProfile() async {
    try {
      // Update Firebase Auth profile name
      await _user?.updateProfile(displayName: _nameController.text);
      await _user?.reload(); // Reload user information
      _user = _auth.currentUser; // Get the updated user

      // Save the updated name and phone number in Firestore
      await _firestore.collection('users').doc(_user?.uid).set({
        'displayName': _nameController.text,
        'email': _user?.email,
        'phoneNumber': _phoneNumberController.text, // Save phone number
        'updatedAt': DateTime.now().toIso8601String(),
      }, SetOptions(merge: true)); // Merge to avoid overwriting existing fields

      // Display success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully')),
      );

      Navigator.pop(context); // Go back to Profile Screen
    } catch (e) {
      // Handle errors here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating profile: $e')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose(); // Dispose phone number controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone, // Set keyboard type for phone input
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              ),
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
