import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const Profile({super.key, required this.auth, required this.firestore});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context); // Navigate back to previous screen
            },
          ),
          ListTile(
            title: const Text('User Details'),
            onTap: () {
              
            },
          ),
          ExpansionTile(
            title: const Text('Settings and Preferences'),
            children: [
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notification'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: true, // Replace with actual value from user settings
                  onChanged: (value) {
                    // Update user settings for dark mode
                  },
                ),
              ),
              ListTile(
                title: const Text('Language'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  
                },
              ),
              ListTile(
                title: Text('Security'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  
                },
              ),
            ],
          ),
          ListTile(
            title: Text('Support'),
            onTap: () {
              
            },
          ),
        ],
      ),
    )
    );
  }
}

