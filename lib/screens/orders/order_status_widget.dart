import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final String date;
  final String location;

  const OrderStatusWidget({
    super.key,
    required this.status,
    required this.date,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.local_shipping),
      title: Text(status),
      subtitle: Text('$date - $location'),
    );
  }
}
