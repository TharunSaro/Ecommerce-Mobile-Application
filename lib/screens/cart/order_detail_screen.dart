import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/models/cart_model.dart';
import '../cart/cart_screen.dart';
import '/screens/home/home_widgets.dart';
import 'package:provider/provider.dart';
import '/models/wishlist_model.dart';

class OrderDetailScreen extends StatefulWidget {
  final String name;
  final double price;
  final String image;
  final String rating;
  final String reviews;
  final String description;

  const OrderDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.description,
  });

  @override
  // ignore: library_private_types_in_public_api
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  int _quantity = 1;
  final String _color = 'Default';
  final String _size = 'M';
  bool isFavorited = false;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistModel>(context, listen: false);
    final cart = Provider.of<CartModel>(context, listen: false);

    final wishlistItem = WishlistItem(
      name: widget.name,
      price: widget.price,
      image: widget.image,
      color: _color,
      size: _size,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                isFavorited = !isFavorited;
              });

              wishlist.addItem(wishlistItem);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Added to wishlist'),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.5,
                    left: 50,
                    right: 50,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.image, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.name,
                style: GoogleFonts.urbanist(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    '${widget.rating} ',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text(
                    ' (${widget.reviews} reviews)',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Description',
                style: GoogleFonts.urbanist(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(widget.description),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Color',
                style: GoogleFonts.urbanist(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ColorOption(color: Colors.black, selected: true),
                  ColorOption(color: Colors.grey),
                  ColorOption(color: Colors.brown),
                  ColorOption(color: Colors.purple),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Quantity',
                style: GoogleFonts.urbanist(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: _decrement,
                  ),
                  Text(
                    '$_quantity',
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _increment,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Total Price: ₹${(widget.price * _quantity).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final cartItem = CartItem(
                        name: widget.name,
                        price: widget.price,
                        image: widget.image,
                        color: _color,
                        size: _size,
                        quantity: _quantity,
                      );
                      cart.addItem(cartItem);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Added to Cart'),
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.5,
                            left: 50,
                            right: 50,
                          ),
                        ),
                      );
                      Navigator.pushNamed(context, '/cart');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 178, 206, 230), // Change to your desired color
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 177, 206, 178), // Change to your desired color
                    ),
                    child: const Text('View Cart'),
                  ),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
