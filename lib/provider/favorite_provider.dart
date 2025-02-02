import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  // Store a set of favorite products with product name and image
  Set<Map<String, String>> _favorites = {};

  Set<Map<String, String>> get favorites => _favorites;

  // Add a product to favorites
  void addToFavorites(String productName, String imagePath) {
    _favorites.add({
      'name': productName,
      'image': imagePath,
    });
    notifyListeners();
  }

  // Remove a product from favorites
  void removeFromFavorites(String productName) {
    _favorites.removeWhere((product) => product['name'] == productName);
    notifyListeners();
  }

  // Check if a product is in favorites
  bool isFavorite(String productName) {
    return _favorites.any((product) => product['name'] == productName);
  }
}
