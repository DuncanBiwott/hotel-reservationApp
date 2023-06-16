import 'package:cloud_firestore/cloud_firestore.dart';

class OrderClass {
  final String orderId;
  final String userId;
  final String title;
  final String type;
  final double price;
  final String date;

  OrderClass({
    required this.orderId,
    required this.userId,
    required this.title,
    required this.type,
    required this.price,
    required this.date,
  });

  factory OrderClass.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return OrderClass(
      orderId: snapshot.id,
      userId: data['userId'],
      title: data['title'],
      type: data['type'],
      price: data['price'].toDouble(),
      date: data['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'type': type,
      'price': price,
      'date': date,
    };
  }
}