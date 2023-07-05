import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourism/model/hotel_class.dart';
import 'package:tourism/services/reservation.dart';
import 'package:tourism/view/dashboard.dart';

class Hotels extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const Hotels({super.key, required this.auth, required this.firestore});

  @override
  State<Hotels> createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
   Future<List<HotelClass>>? _hotelFuture;
  final Reservation reservation = Reservation();

  @override
  void initState() {
    super.initState();
    _hotelFuture = reservation.getHotels();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:RefreshIndicator(
          
         onRefresh: () {
          setState(() {
            _hotelFuture = reservation.getHotels();
          });
          return _hotelFuture!;
        },
        child: FutureBuilder(
          future: _hotelFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text("Loading....."));
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error retrieving data'));
            } else {
              List<HotelClass> hotels= snapshot.data as List<HotelClass>;
              return ListView.builder(
                itemCount: hotels.length,
                itemBuilder: (context, index){
                    final hotel = hotels[index];
                    return HotelCard(
                      auth: widget.auth,
                      firestore: widget.firestore,
                      amount: hotel.amount,
                      image: hotel.image,
                      name: hotel.name,
                       description: hotel.description,
                        location: hotel.location,
                         rating: hotel.rating, 
                         reviews: hotel.reviews,
                    );
                }
                );
          }
          }
        ),
          )
      
      ),
    );
  }
}
