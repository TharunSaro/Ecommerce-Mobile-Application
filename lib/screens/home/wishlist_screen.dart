import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/wishlist_model.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
      ),
      body: wishlist.items.isEmpty
          ? const Center(child: Text('Your wishlist is empty'))
          : ListView.builder(
              itemCount: wishlist.items.length,
              itemBuilder: (context, index) {
                final item = wishlist.items[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    leading: Image.asset(item.image, fit: BoxFit.cover),
                    title: Text(item.name),
                    subtitle: Text('Color: ${item.color} | Size: ${item.size}\n₹${item.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        wishlist.removeItem(item);
                      },
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
