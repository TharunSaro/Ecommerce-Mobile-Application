import 'package:flutter/foundation.dart';

class CartItem {
  final String name;
  final double price;
  final String image;
  final String color;
  final String size;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    required this.color,
    required this.size,
    this.quantity = 1,
  });
}

class CartModel with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void incrementQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decrementQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      notifyListeners();
    }
  }

  double get totalPrice {
    return _items.fold(0.0, (total, item) => total + item.price * item.quantity);
  }
}
