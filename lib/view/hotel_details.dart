import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourism/constants/constants.dart';
import 'package:tourism/view/hotel_res.dart';

class HotelDetailsPage extends StatelessWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final String name;
  final String image;
  final double amount;
  final String description;
  final String location;
  final String rating;
  final String reviews;
   const HotelDetailsPage({super.key, required this.auth, required this.firestore, required this.name, required this.image, required this.amount, required this.description, required this.location, required this.rating, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 300,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Image.network(image),
                            Image.network(image),
                            Image.network(image),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {
                              // Handle share button press
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: dblack),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Row(
                      children: [
                        Text(
                          location,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '❤️',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '$rating ($reviews Reviews)',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Description',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: dblack),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.all(16),
                    child: Expanded(
                      child: Text(
                        description,
                       // 'Hotel Luxury offers a luxurious and comfortable stay in the heart of Beautiful City. With its modern amenities, spacious rooms, and exceptional services, it is the perfect choice for both leisure and business travelers. Enjoy stunning views, exquisite dining options, and a range of recreational facilities, including a swimming pool, spa, and fitness center. Our dedicated staff is committed to providing you with an unforgettable experience.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Facilities',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: dblack),
                    ),
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FacilityItem(icon: Icons.wifi, name: 'Wifi'),
                        FacilityItem(icon: Icons.pool, name: 'Pool'),
                        FacilityItem(icon: Icons.sports_gymnastics, name: 'Gym'),
                        FacilityItem(icon: Icons.local_parking, name: 'Parking'),
                      ],
                    ),
                  ),
                  
              ],
            ),
                
              ),
          ),
          Container(
            height: 60,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left:8.0,right: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Starts from',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$$amount',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: dblack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {

                        // Handle button press
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddHotelReservationScreen(auth: auth, firestore: firestore)),
                          );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: dblack,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                           
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'Book Now',
                          style: TextStyle(fontSize: 14,color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
        
    
      
      
    );
  }
}

class FacilityItem extends StatelessWidget {
  final IconData icon;
  final String name;

  const FacilityItem({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(icon, color: dblack),
          ),
          const SizedBox(height: 4),
          Text(name),
        ],
      ),
    );
  }
}
