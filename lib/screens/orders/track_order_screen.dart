import 'package:flutter/material.dart';
import 'order_tracker_widget.dart';

class TrackOrderScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  const TrackOrderScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final List<OrderStatus> orderStatuses = [
      OrderStatus(status: 'Order In Transit', date: 'Dec 17', isCompleted: false),
      OrderStatus(status: 'Order Cleared Customs Port', date: 'Dec 17', isCompleted: true),
      OrderStatus(status: 'Order Shipped', date: 'Dec 15', isCompleted: true),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(order['image'] as String, width: 50, height: 50), // Display the order image
              title: Text(order['title'] as String),
              subtitle: Text('₹${order['price']} - ${order['status']}'),
            ),
            const Divider(),
            Expanded(
              child: OrderTrackerWidget(orderStatuses: orderStatuses),
            ),
          ],
        ),
      ),
    );
  }
}
