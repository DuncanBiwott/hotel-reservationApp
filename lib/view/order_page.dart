import 'package:flutter/material.dart';
import 'package:tourism/services/reservation.dart';

import '../model/order.dart';

class OrderPage extends StatefulWidget {
  final String userId;

  OrderPage({required this.userId});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Future<List<OrderClass>>? _ordersFuture;
  final Reservation reservation = Reservation();

  @override
  void initState() {
    super.initState();
    _ordersFuture = reservation.getOrders(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: RefreshIndicator(
        color: Colors.blue,
        onRefresh: () {
          setState(() {
            _ordersFuture = reservation.getOrders(userId: widget.userId);
          });
          return _ordersFuture!;
        },
        child: FutureBuilder(
          future: _ordersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error retrieving orders'));
            } else {
              List<OrderClass> orders = snapshot.data as List<OrderClass>;
              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: const Icon(Icons.shopping_basket),
                        title: Text(
                          order.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 5.0),
                            Text(
                              'Order Type: ${order.type}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              'Price: \$${order.price.toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              'Date: ${order.date}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
