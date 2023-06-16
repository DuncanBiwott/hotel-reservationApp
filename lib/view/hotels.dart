import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourism/view/dashboard.dart';

class Hotels extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const Hotels({super.key, required this.auth, required this.firestore});

  @override
  State<Hotels> createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HotelCard(
              auth: widget.auth,
              firestore: widget.firestore,
              amount: 25,
              image: 'assets/images/hotel1.jpeg',
              name: 'Atana Musandam Resort',
            ),
            HotelCard(
              auth: widget.auth,
              firestore: widget.firestore,
              amount: 25,
              image: 'assets/images/hotel2.jpeg',
              name: 'Starry Domes Desert Camp',
            ),
            HotelCard(
              auth: widget.auth,
              firestore: widget.firestore,
              amount: 25,
              image: 'assets/images/hotel2.jpeg',
              name: 'Barcelo Mussanah Resort',
            ),
            HotelCard(
              auth: widget.auth,
              firestore: widget.firestore,
              amount: 25,
              image: 'assets/images/hotel1.jpeg',
              name: 'Sama al Wasil Desert Camp',
            ),
            HotelCard(
              auth: widget.auth,
              firestore: widget.firestore,
              amount: 25,
              image: 'assets/images/hotel1.jpeg',
              name: 'Sur Grand Hotel',
            ),
            HotelCard(
              auth: widget.auth,
              firestore: widget.firestore,
              amount: 25,
              image: 'assets/images/hotel2.jpeg',
              name: 'Sifawy Boutique Hotel',
            ),
            HotelCard(
              auth: widget.auth,
              firestore: widget.firestore,
              amount: 25,
              image: 'assets/images/hotel1.jpeg',
              name: 'Sur Plaza Hotel',
            ),
            HotelCard(
              auth: widget.auth,
              firestore: widget.firestore,
              amount: 25,
              image: 'assets/images/hotel1.jpeg',
              name: 'Wadi Shab Guest House',
            ),
          ],
        )),
      ),
    );
  }
}
