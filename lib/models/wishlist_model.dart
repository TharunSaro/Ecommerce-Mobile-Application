import 'package:flutter/foundation.dart';

class WishlistItem {
  final String name;
  final double price;
  final String image;
  final String color;
  final String size;

  WishlistItem({
    required this.name,
    required this.price,
    required this.image,
    required this.color,
    required this.size,
  });
}

class WishlistModel with ChangeNotifier {
  final List<WishlistItem> _items = [];

  List<WishlistItem> get items => _items;

  void addItem(WishlistItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(WishlistItem item) {
    _items.remove(item);
    notifyListeners();
  }
}
