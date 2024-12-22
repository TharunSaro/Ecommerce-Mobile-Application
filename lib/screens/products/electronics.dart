import 'package:flutter/material.dart';

class ElectronicsScreen extends StatelessWidget {
  const ElectronicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electronics'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        itemCount: electronics.length, // This should be the list of electronic items
        itemBuilder: (context, index) {
          final electronic = electronics[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    electronic.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    electronic.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '₹${electronic.price.toStringAsFixed(2)}',
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

// Example electronic item data
class Electronic {
  final String name;
  final double price;
  final String image;

  Electronic({required this.name, required this.price, required this.image});
}

final electronics = [
  Electronic(name: 'TWS', price: 29999.00, image: 'assets/images/electronics/electronic1.jpg'),
  Electronic(name: 'Bluetooth Headphones', price: 59999.00, image: 'assets/images/electronics/electronic2.png'),
  Electronic(name: 'Gaming Laptop', price: 4999.00, image: 'assets/images/electronics/electronic3.jpeg'),
  Electronic(name: 'Student Laptop', price: 39999.00, image: 'assets/images/electronics/electronic4.jpg'),
  Electronic(name: 'iPhone 15 Pro', price: 29999.00, image: 'assets/images/electronics/electronic5.jpg'),
  Electronic(name: 'Samsung S20 FE', price: 59999.00, image: 'assets/images/electronics/electronic6.jpg'),
  Electronic(name: 'iQOO Neo 7 Pro', price: 4999.00, image: 'assets/images/electronics/electronic7.jpg'),
  Electronic(name: 'Redmi 13C', price: 39999.00, image: 'assets/images/electronics/electronic8.jpg'),
  // Add more electronics as needed
];
