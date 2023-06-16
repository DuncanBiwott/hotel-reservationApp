import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourism/view/flights.dart';
import 'package:tourism/view/hotels.dart';
import 'package:tourism/view/order_page.dart';
import 'package:tourism/view/restaurants.dart';

import 'dashboard.dart';

class Home extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const Home({Key? key, required this.auth, required this.firestore}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 late User? user;
   @override
  void initState() {
    super.initState();
    user = widget.auth.currentUser;
  }

 

  int _selectedIndex = 0;

  List<Widget> _pages ()=><Widget> [
    WelcomePage(auth:widget.auth, firestore: widget.firestore,),
    Hotels(auth:widget.auth, firestore: widget.firestore,),
    Restaurants(auth: widget.auth, firestore: widget.firestore),
    Flights(auth: widget.auth, firestore: widget.firestore,),
    OrderPage(userId: user!.uid,)
  
    

    
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: _pages()[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.green,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house,size: 20.0,),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.squareH,size: 20.0),
              label: "Hotel",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.utensils,size: 20.0),
              label: "Restaurant",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.plane,size: 20.0),
              label: "Flight",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bagShopping,size: 20.0),
              label: "Order",
            ),
            
          ]),
      )
      
      
      
    );
  }
}