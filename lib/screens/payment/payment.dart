// payment_method.dart
class PaymentMethod {
  final String name;
  final String iconPath;
  final String? cardNumber;
  bool isConnected;

  PaymentMethod({
    required this.name,
    required this.iconPath,
    this.cardNumber,
    this.isConnected = false,
  });
}
