import 'package:cbook_user/provider/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Import the provider class

class ProductCard2 extends StatelessWidget {
  final String productName;
  final double price;
  final int discount;
  final String image;
  final void Function()? onPressed;

  const ProductCard2({
    super.key,
    required this.productName,
    required this.price,
    required this.discount,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to product details page
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(height: 1, color: Colors.grey),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                "OFF ${discount.toString()} %",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              price.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            // Add product to the cart
                            final product = {
                              'productName': productName,
                              'price': price,
                              'discount': discount,
                              'image': image,
                            };

                            Provider.of<MyCardptovider>(context, listen: false)
                                .addProductToCart(product, context);
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
