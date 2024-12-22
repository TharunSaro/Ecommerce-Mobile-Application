import 'package:flutter/material.dart';

class OrderItemWidget extends StatelessWidget {
  final String title;
  final double price;
  final String status;
  final String image;
  final VoidCallback? onTrackOrder;
  final VoidCallback? onLeaveReview;

  const OrderItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.status,
    required this.image,
    this.onTrackOrder,
    this.onLeaveReview,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          leading: Image.asset(image, width: 70, height: 70), // Enlarge the image
          title: Text(title),
          subtitle: Text('₹$price - $status'),
          trailing: status == 'Completed'
              ? ElevatedButton(
                  onPressed: onLeaveReview,
                  child: const Text('Leave Review'),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white), // Add color to the button
                  onPressed: onTrackOrder,
                  child: const Text('Track Order'),
                ),
        ),
        const Divider(height: 1, color: Colors.transparent), // Invisible divider
      ],
    );
  }
}
