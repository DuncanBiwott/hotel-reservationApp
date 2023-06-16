import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourism/view/dashboard.dart';

class Restaurants extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const Restaurants({super.key, required this.auth, required this.firestore});

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RestaurantCard(
                auth: widget.auth,
                firestore: widget.firestore,
                image: 'assets/images/hotel1.jpeg',
                restaurant: 'Thousand Nights Camp',
                amount: 20.0,
              ),
              RestaurantCard(
                auth: widget.auth,
                firestore: widget.firestore,
                image: 'assets/images/hotel1.jpeg',
                restaurant: 'Atana Khasab Hotel',
                amount: 20.0,
              ),
              RestaurantCard(
                auth: widget.auth,
                firestore: widget.firestore,
                image: 'assets/images/hotel1.jpeg',
                restaurant: 'Radisson Blu Hotel Sohar',
                amount: 20.0,
              ),
              RestaurantCard(
                auth: widget.auth,
                firestore: widget.firestore,
                image: 'assets/images/hotel1.jpeg',
                restaurant: 'Turtle Beach Resort',
                amount: 20.0,
              ),
              RestaurantCard(
                auth: widget.auth,
                firestore: widget.firestore,
                image: 'assets/images/hotel1.jpeg',
                restaurant: 'Turtle Beach Resort',
                amount: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
