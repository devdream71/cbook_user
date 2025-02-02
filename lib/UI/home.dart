import 'package:cbook_user/UI/card/card.dart';
import 'package:cbook_user/UI/product_details_page.dart';
import 'package:cbook_user/utils/widget/auto_scroll_carousel.dart';
import 'package:cbook_user/utils/widget/product_card2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Map<String, dynamic>> productList = [
    {
      "productName": "Lotto Premium Slide",
      "price": 400.00,
      "discount": 30,
      "image": "assets/product_1.png",
    },
    {
      "productName": "Winter Black Jacket",
      "price": 500.00,
      "discount": 20,
      "image": "assets/winter_jacket.png",
    },
    {
      "productName": "Bluetooth Headphones",
      "price": 120.00,
      "discount": 10,
      "image": "assets/bluethooth_headphone.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const AutoScrollCarousel(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'E-Commerce',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ProductCard2(
                  onPressed: () {
                    print("clicked");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductCardDetails(
                                  productName: productList[index]
                                      ['productName'],
                                  price: productList[index]['price'],
                                  discount: productList[index]['discount'],
                                  image: productList[index]['image'],
                                )));
                  },
                  productName: productList[index]['productName'],
                  price: productList[index]['price'],
                  discount: productList[index]['discount'],
                  image: productList[index]["image"],
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
