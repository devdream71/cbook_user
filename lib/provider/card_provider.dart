import 'package:flutter/material.dart';

class MyCardptovider extends ChangeNotifier {

  int _quantity = 1;

  int get quantity => _quantity;

  void increaseQuantity() {
    _quantity++;
    notifyListeners();  // Notify listeners to rebuild UI
  }

  void decreaseQuantity() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();  // Notify listeners to rebuild UI
    }
  }
  
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  // int get cartItemCount {
  //   int totalItems = 0;
  //   for (var item in _cartItems) {
  //     totalItems += (item['quantity'] as int); // Explicitly cast to int
  //   }
  //   return totalItems;
  // }

  int get cartItemCount => _cartItems.length;

  void addProductToCart(Map<String, dynamic> product, BuildContext context) {
    bool isProductInCart = false;
    for (var item in _cartItems) {
      if (item['productName'] == product['productName']) {
        item['quantity']++;
        isProductInCart = true;
        break;
      }
    }
    if (!isProductInCart) {
      product['quantity'] = 1;
      _cartItems.add(product);
    }
    notifyListeners();

    // Show Snackbar when a product is added
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product['productName']} added to cart!'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void removeProductFromCart(Map<String, dynamic> product) {
    _cartItems
        .removeWhere((item) => item['productName'] == product['productName']);
    notifyListeners();
  }

  void incrementQuantity(Map<String, dynamic> product) {
    for (var item in _cartItems) {
      if (item['productName'] == product['productName']) {
        item['quantity']++;
        break;
      }
    }
    notifyListeners();
  }

  void decrementQuantity(Map<String, dynamic> product) {
    for (var item in _cartItems) {
      if (item['productName'] == product['productName'] &&
          item['quantity'] > 1) {
        item['quantity']--;
        break;
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in _cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }
}
