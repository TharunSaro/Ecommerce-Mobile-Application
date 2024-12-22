import 'package:flutter/material.dart';

class WatchesScreen extends StatelessWidget {
  const WatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watches'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        itemCount: watches.length, // This should be the list of watch items
        itemBuilder: (context, index) {
          final watch = watches[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    watch.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    watch.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '₹${watch.price.toStringAsFixed(2)}',
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

// Example watch item data
class Watch {
  final String name;
  final double price;
  final String image;

  Watch({required this.name, required this.price, required this.image});
}

final watches = [
  Watch(name: 'Rolex Submariner', price: 850000.00, image: 'assets/images/watches/watch1.png'),
  Watch(name: 'Gold Watch', price: 49999.00, image: 'assets/images/watches/watch2.png'),
  Watch(name: 'Casio G-Shock', price: 9999.00, image: 'assets/images/watches/watch3.png'),
  Watch(name: 'Timex Expedition', price: 6999.00, image: 'assets/images/watches/watch4.png'),
  Watch(name: 'Rolex mariner', price: 850000.00, image: 'assets/images/watches/watch5.png'),
  Watch(name: 'Apple Dream', price: 49999.00, image: 'assets/images/watches/watch6.jpeg'),
  Watch(name: 'Casio Chain', price: 9999.00, image: 'assets/images/watches/watch7.jpg'),
  Watch(name: 'Timex ledition', price: 6999.00, image: 'assets/images/watches/watch8.jpg'),
  // Add more watches as needed
];
