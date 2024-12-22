import 'package:flutter/material.dart';
import '/screens/cart/order_detail_screen.dart';

class ProductGrid extends StatelessWidget {
  final List<Map<String, String>> products;

  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailScreen(
                    name: product['name']!,
                    price: double.parse(product['price']!.replaceAll('₹', '')), // Ensure price is converted to double
                    image: product['image']!,
                    rating: product['rating']!,
                    reviews: product['reviews']!,
                    description: product['description']!,
                  ),
                ),
              );
            },
            child: ProductCard(
              name: product['name']!,
              price: product['price']!,
              image: product['image']!,
              rating: product['rating']!,
              reviews: product['reviews']!,
              description: product['description']!,
            ),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final String rating;
  final String reviews;
  final String description;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: const TextStyle(color: Colors.green),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 16),
                Text(
                  '$rating ($reviews reviews)',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;
  final bool selected;

  const ColorOption({
    super.key,
    required this.color,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 16,
      child: selected ? const Icon(Icons.check, color: Colors.white) : null,
    );
  }
}