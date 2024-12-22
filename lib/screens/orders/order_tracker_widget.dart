// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OrderTrackerWidget extends StatelessWidget {
  final List<OrderStatus> orderStatuses;

  const OrderTrackerWidget({
    super.key,
    required this.orderStatuses,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: orderStatuses.map((status) {
        int currentIndex = orderStatuses.indexOf(status);
        bool isLast = currentIndex == orderStatuses.length - 1;
        bool isCompleted = status.isCompleted;

        return Row(
          children: [
            Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: isCompleted ? Colors.green : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: isCompleted
                      ? Icon(Icons.check, color: Colors.white, size: 15)
                      : Container(),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 50,
                    color: Colors.grey,
                  ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status.status,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isCompleted ? Colors.black : Colors.grey,
                  ),
                ),
                Text(
                  status.date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}

class OrderStatus {
  final String status;
  final String date;
  final bool isCompleted;

  OrderStatus({
    required this.status,
    required this.date,
    required this.isCompleted,
  });
}
