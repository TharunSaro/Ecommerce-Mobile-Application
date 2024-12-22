import 'package:flutter/material.dart';

class ShoesScreen extends StatelessWidget {
  const ShoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoes'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        itemCount: shoes.length, // This should be the list of shoe items
        itemBuilder: (context, index) {
          final shoe = shoes[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    shoe.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    shoe.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '₹${shoe.price.toStringAsFixed(2)}',
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

// Example shoe item data
class Shoe {
  final String name;
  final double price;
  final String image;

  Shoe({required this.name, required this.price, required this.image});
}

final shoes = [
  Shoe(name: 'Suga Leather Shoes', price: 375.00, image: 'assets/images/shoes/shoe1.png'),
  Shoe(name: 'Puma White Shoes', price: 415.00, image: 'assets/images/shoes/shoe2.png'),
  Shoe(name: 'Puma Yellow Black', price: 390.00, image: 'assets/images/shoes/shoe3.png'),
  Shoe(name: 'Nike Blue Shoes', price: 380.00, image: 'assets/images/shoes/shoe4.png'),
  Shoe(name: 'Pink footware', price: 375.00, image: 'assets/images/shoes/shoe5.jpg'),
  Shoe(name: 'Elegant Women footware', price: 415.00, image: 'assets/images/shoes/shoe6.jpeg'),
  Shoe(name: 'Classic Canvas Men', price: 390.00, image: 'assets/images/shoes/shoe7.jpg'),
  Shoe(name: 'Nike Grey Shoes', price: 380.00, image: 'assets/images/shoes/shoe8.jpg'),
  // Add more shoes as needed
];
