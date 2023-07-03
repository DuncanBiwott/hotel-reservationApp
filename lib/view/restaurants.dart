import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourism/model/restaurant_class.dart';
import 'package:tourism/services/reservation.dart';
import 'package:tourism/view/dashboard.dart';

class Restaurants extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const Restaurants({super.key, required this.auth, required this.firestore});

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  Future<List<RestaurantClass>>? _restaurantFuture;
  final Reservation reservation = Reservation();

  @override
  void initState() {
    super.initState();
    _restaurantFuture = reservation.getRestaurants();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () {
            setState(() {
              _restaurantFuture = reservation.getRestaurants();
            });
            return _restaurantFuture!;
          },
          child: FutureBuilder(
            future: _restaurantFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error retrieving data'));
              } else {
                List<RestaurantClass> restaurants =
                    snapshot.data as List<RestaurantClass>;
                return ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurants[index];
                    return RestaurantCard(
                      auth: widget.auth,
                      firestore: widget.firestore,
                      amount: restaurant.amount,
                      image: restaurant.image,
                      name: restaurant.name,
                      description: restaurant.description,
                      location: restaurant.location,
                      rating: restaurant.rating,
                      reviews: restaurant.reviews,
                    );
                  },
                );
              }
            },
          ), 
          
          )
      ),
    );
  }
}
