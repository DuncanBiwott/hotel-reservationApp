import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourism/view/dashboard.dart';

class Flights extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const Flights({super.key, required this.auth, required this.firestore});

  @override
  State<Flights> createState() => _FlightsState();
}

class _FlightsState extends State<Flights> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlightCard(
              auth: widget.auth,
              firestore: widget.firestore,
              amount: 25.0,
              image: 'assets/images/flight1.jpg',
              name: 'Muscat International Airport',
            ),
            FlightCard(
              auth: widget.auth,
              firestore: widget.firestore,
              image: 'assets/images/flight2.jpeg',
              name: 'Duqm Airport',
              amount: 26.0,
            ),
            FlightCard(
              auth: widget.auth,
              firestore: widget.firestore,
              image: 'assets/images/flight3.jpeg',
              name: 'Ras Hadd Airport',
              amount: 28.0,
            ),
            FlightCard(
              auth: widget.auth,
              firestore: widget.firestore,
              image: 'assets/images/flight4.jpg',
              name: 'Muscat International Airport',
              amount: 30.0,
            ),
            FlightCard(
              auth: widget.auth,
              firestore: widget.firestore,
              amount: 20.0,
              image: 'assets/images/flight1.jpg',
              name: 'Salalah International Airport',
            ),
            FlightCard(
              auth: widget.auth,
              firestore: widget.firestore,
              image: 'assets/images/flight.png',
              name: 'Suhar International Airprot',
              amount: 26.0,
            ),
            FlightCard(
              auth: widget.auth,
              firestore: widget.firestore,
              image: 'assets/images/flight2.jpeg',
              name: 'Marmul Airprot',
              amount: 25.0,
            ),
            FlightCard(
              auth: widget.auth,
              firestore: widget.firestore,
              image: 'assets/images/flight3.jpeg',
              name: 'Khasab Airport',
              amount: 28.0,
            ),
            FlightCard(
              auth: widget.auth,
              firestore: widget.firestore,
              image: 'assets/images/flight4.jpg',
              name: 'Duqm International Airport',
              amount: 25.0,
            ),
            FlightCard(
              auth: widget.auth,
              firestore: widget.firestore,
              image: 'assets/images/flight5.jpeg',
              name: 'Dibba Airport',
              amount: 25.0,
            ),
          ],
        )),
      ),
    );
  }
}
