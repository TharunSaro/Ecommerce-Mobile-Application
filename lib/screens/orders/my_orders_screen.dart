// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'review_bottom_sheet.dart';
import 'order_item_widget.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildOngoingOrders() {
    final List<Map<String, dynamic>> ongoingOrders = [
      {'title': 'Suga Leather Shoes', 'price': 375.00, 'status': 'In Delivery', 'image': 'assets/images/shoes/shoe1.png'},
      {'title': 'Werolla Cardigans', 'price': 385.00, 'status': 'In Delivery', 'image': 'assets/images/bags/bag6.jpg'},
      {'title': 'Vinia Headphone', 'price': 360.00, 'status': 'In Delivery', 'image': 'assets/images/electronics/electronic2.png'},
    ];

    return ListView.builder(
      itemCount: ongoingOrders.length,
      itemBuilder: (context, index) {
        final order = ongoingOrders[index];
        return OrderItemWidget(
          title: order['title'] as String,
          price: order['price'] as double,
          status: order['status'] as String,
          image: order['image'] as String,
          onTrackOrder: () {
            Navigator.pushNamed(
              context,
              '/trackOrder',
              arguments: order,
            );
          },
        );
      },
    );
  }

  Widget _buildCompletedOrders() {
    final List<Map<String, dynamic>> completedOrders = [
      {'title': 'Sonia Headphone', 'price': 325.00, 'status': 'Completed', 'image': 'assets/images/electronics/electronic1.jpg'},
      {'title': 'Mini Leather Bag', 'price': 540.00, 'status': 'Completed', 'image': 'assets/images/bags/bag6.jpg'},
      {'title': 'Puma Sneaker Shoe', 'price': 390.00, 'status': 'Completed', 'image': 'assets/images/shoes/shoe8.jpg'},
    ];

    return ListView.builder(
      itemCount: completedOrders.length,
      itemBuilder: (context, index) {
        final order = completedOrders[index];
        return OrderItemWidget(
          title: order['title'] as String,
          price: order['price'] as double,
          status: order['status'] as String,
          image: order['image'] as String,
          onLeaveReview: () {
            showReviewBottomSheet(context, order);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Ongoing"),
            Tab(text: "Completed"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOngoingOrders(),
          _buildCompletedOrders(),
        ],
      ),
    );
  }
}
