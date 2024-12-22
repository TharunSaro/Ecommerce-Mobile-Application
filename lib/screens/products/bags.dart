import 'package:flutter/material.dart';

class BagsScreen extends StatelessWidget {
  const BagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bags'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        itemCount: bags.length, // This should be the list of bag items
        itemBuilder: (context, index) {
          final bag = bags[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    bag.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    bag.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '₹${bag.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Example bag item data
class Bag {
  final String name;
  final double price;
  final String image;

  Bag({required this.name, required this.price, required this.image});
}

final bags = [
  Bag(name: 'Leather Backpack', price: 2499.00, image: 'assets/images/bags/bag1.png'),
  Bag(name: 'Travel Duffel', price: 799.00, image: 'assets/images/bags/bag2.png'),
  Bag(name: 'Laptop Bag', price: 1599.00, image: 'assets/images/bags/bag3.png'),
  Bag(name: 'Canvas Tote', price: 1299.00, image: 'assets/images/bags/bag4.png'),
  Bag(name: 'Leather Backpack', price: 2499.00, image: 'assets/images/bags/bag5.jpg'),
  Bag(name: 'Hand Bag', price: 799.00, image: 'assets/images/bags/bag6.jpg'),
  Bag(name: 'Cow Kid Duffel', price: 1599.00, image: 'assets/images/bags/bag7.jpg'),
  Bag(name: 'School Backpack', price: 1299.00, image: 'assets/images/bags/bag8.jpg'),
];
