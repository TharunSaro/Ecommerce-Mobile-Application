import 'package:flutter/material.dart';

class ClothesScreen extends StatelessWidget {
  const ClothesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clothes'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        itemCount: clothes.length, // This should be the list of clothes items
        itemBuilder: (context, index) {
          final cloth = clothes[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    cloth.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cloth.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '₹${cloth.price.toStringAsFixed(2)}',
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

// Example cloth item data
class Cloth {
  final String name;
  final double price;
  final String image;

  Cloth({required this.name, required this.price, required this.image});
}

final clothes = [
  Cloth(name: 'Money Heist T-Shirt', price: 999.00, image: 'assets/images/clothes/men1.jpg'),
  Cloth(name: 'Blue Shorts', price: 1299.00, image: 'assets/images/clothes/men2.jpg'),
  Cloth(name: 'Formal Suit', price: 3999.00, image: 'assets/images/clothes/men3.jpg'),
  Cloth(name: 'Formal Pants', price: 1499.00, image: 'assets/images/clothes/men4.jpg'),
  Cloth(name: 'Casual Shirt', price: 999.00, image: 'assets/images/clothes/men5.jpg'),
  Cloth(name: 'White Pants', price: 1299.00, image: 'assets/images/clothes/men6.jpg'),
  Cloth(name: 'Sweat T-shirt', price: 3999.00, image: 'assets/images/clothes/men7.jpg'),
  Cloth(name: 'Regular Jeans', price: 1499.00, image: 'assets/images/clothes/men8.jpg'),
  // Add more clothes as needed
];
