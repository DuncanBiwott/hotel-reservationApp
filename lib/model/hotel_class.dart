import 'package:cloud_firestore/cloud_firestore.dart';

class HotelClass {
 final String name;
  final String image;
  final double amount;
  final String description;
  final String location;
  final String rating;
  final String reviews;

  HotelClass({
    required this.name,
    required this.image,
    required this.amount,
    required this.description,
    required this.location,
    required this.rating,
    required this.reviews,
  });

  factory HotelClass.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return HotelClass(
      name: data['name'],
      image: data['image'],
      amount: data['amount'],
      description: data['description'],
      location: data['location'],
      rating: data['rating'],
      reviews: data['reviews'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'amount': amount,
      'description': description,
      'location': location,
      'rating': rating,
      'reviews': reviews,
    };
  }
}