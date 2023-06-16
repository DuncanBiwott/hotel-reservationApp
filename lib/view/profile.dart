import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourism/constants/constants.dart';
import 'package:tourism/controller/Root/auth.dart';

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
          title: const Text("profile"),
          elevation: 0,
        ),
        drawer:Drawer(backgroundColor: primary,
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Authenticate(auth: widget.auth).signOut();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    Text("Logout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 32.0),),
                    SizedBox(width: 5.0,),
                    Icon(FontAwesomeIcons.arrowRightToBracket,color: Colors.white,)
                    
                  ],
                ),
              ),
            )
          ],
        )
        ) ,
      ),
    );
  }
}