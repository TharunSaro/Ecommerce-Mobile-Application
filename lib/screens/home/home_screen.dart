import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_widgets.dart';
import '../notifications/notifications.dart';
import 'wishlist_screen.dart';
import '/screens/products/bags.dart';
import '/screens/products/clothes.dart';
import '/screens/products/electronics.dart';
import '/screens/products/shoes.dart';
import '/screens/products/watches.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Evira',
          style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WishlistScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile_picture.jpg'),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Welcome back 👋\nTharun Saro',
                    style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                            color: Colors.indigo, letterSpacing: .5)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Special Offers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/special_offer.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '30%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            "Today's special!\nGet discount for every\norder today."),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryIcon(
                    icon: Icons.checkroom,
                    label: 'Clothes',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClothesScreen()),
                      );
                    },
                  ),
                  CategoryIcon(
                    icon: Icons.watch,
                    label: 'Watches',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WatchesScreen()),
                      );
                    },
                  ),
                  CategoryIcon(
                    icon: Icons.shower,
                    label: 'Shoes',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShoesScreen()),
                      );
                    },
                  ),
                  CategoryIcon(
                    icon: Icons.shopping_bag,
                    label: 'Bags',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BagsScreen()),
                      );
                    },
                  ),
                  CategoryIcon(
                    icon: Icons.phone_android,
                    label: 'Electronics',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ElectronicsScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Most Popular',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const ProductGrid(
              products: [
                {
                  'name': 'Snake Leather Bag',
                  'price': '₹4450.00',
                  'image': 'assets/images/most_popular/snake_leather_bag.jpg',
                  'rating': '4.5',
                  'reviews': '1.9k',
                  'description':
                      'Elegant and unique, crafted from genuine snake leather for a luxurious touch.'
                },
                {
                  'name': 'Leather Shoes',
                  'price': '₹3750.00',
                  'image': 'assets/images/most_popular/suga_leather_shoes.jpg',
                  'rating': '4.7',
                  'reviews': '2.3k',
                  'description':
                      'Classic and comfortable, made from premium leather for everyday wear.'
                },
                {
                  'name': 'Stripped Casual Suit',
                  'price': '₹4200.00',
                  'image': 'assets/images/most_popular/leather_casual_suit.jpg',
                  'rating': '4.3',
                  'reviews': '3.6k',
                  'description':
                      'Stylish and versatile, perfect for both formal and casual occasions.'
                },
                {
                  'name': 'Black Leather Bag',
                  'price': '₹7600.00',
                  'image': 'assets/images/most_popular/black_leather_bag.jpg',
                  'rating': '4.9',
                  'reviews': '1.5k',
                  'description':
                      'Sleek and durable, an essential accessory for any wardrobe.'
                },
                {
                  'name': 'Airtight Microphone',
                  'price': '₹1200.00',
                  'image': 'assets/images/most_popular/airtight_microphone.jpg',
                  'rating': '4.0',
                  'reviews': '1.8k',
                  'description':
                      'High-quality sound with an airtight design for clear and professional audio.'
                },
                {
                  'name': 'Black Nike Shoes',
                  'price': '₹4000.00',
                  'image': 'assets/images/most_popular/black_nike_shoes.png',
                  'rating': '4.5',
                  'reviews': '3.7k',
                  'description':
                      'Sporty and stylish, offering comfort and performance for active lifestyles.'
                },
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CategoryIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, size: 30),
          ),
          const SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}
