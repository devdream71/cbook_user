import 'package:cbook_user/UI/favourite_page.dart';
import 'package:cbook_user/provider/card_provider.dart';
import 'package:cbook_user/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductCardDetails extends StatelessWidget {
  final String productName;
  final double price;
  final int discount;
  final String image;

  const ProductCardDetails({
    super.key,
    required this.productName,
    required this.price,
    required this.discount,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFavorite = favoritesProvider.isFavorite(productName);

    // Access the MyCardptovider to get the quantity
    final productProvider = Provider.of<MyCardptovider>(context);
    final quantity = productProvider.quantity;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Khamar Bari Shop',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "E-commerce",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              if (isFavorite) {
                favoritesProvider.removeFromFavorites(productName);
              } else {
                favoritesProvider.addToFavorites(productName, image);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.list, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  width: 150,
                  height: 100,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      '৳ ${price}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.lato().fontFamily,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        '${discount}% OFF',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.blue),
                      onPressed: () {
                        productProvider.decreaseQuantity();
                      },
                    ),
                    Text(
                      '$quantity', // Show the dynamic quantity
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Colors.blue),
                      onPressed: () {
                        productProvider.increaseQuantity();
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              productName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const Text(
              'This is a high-quality product with premium features, ensuring great durability and value for money.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 36),
            _buildRowWithUnderline("Price", "৳ ${price}"),
            _buildRowWithUnderline("Qty", "$quantity"), // Use dynamic quantity
            _buildRowWithUnderline("Total",
                "৳ ${price * quantity}"), // Calculate total with dynamic quantity
            _buildRowWithUnderline("Discount", "৳ ${discount}"),
            _buildRowWithUnderline(
                "Amount", "৳ ${(price * quantity) - discount}"),

            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 150.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Final Submit',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text('Add to Cart',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowWithUnderline(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 150.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 16)),
              Text(value, style: const TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 4),
          Container(height: 1, color: Colors.black),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
