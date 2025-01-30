import 'package:cbook_user/UI/category_list.dart';
import 'package:cbook_user/utils/widget/auto_scroll_carousel.dart';
import 'package:cbook_user/utils/widget/product_card2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({super.key});

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
      "price": 1200.00,
      "discount": 10,
      "image": "assets/bluethooth_headphone.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryList()));
                },
                child: const SizedBox(
                  child: Row(
                    children: [
                      Icon(
                        Icons.widgets,
                        color: Colors.pink,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Category",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true, // Makes GridView take only the space it needs
                physics:
                    const NeverScrollableScrollPhysics(), // Prevents GridView from scrolling independently
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: 2, // Number of items in the grid
                itemBuilder: (context, index) {
                  return ProductCard2(
                    productName: productList[index]['productName'],
                    price: productList[index]['price'],
                    discount: productList[index]['discount'],
                    image: productList[index]["image"],
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const AutoScrollCarousel(),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                shrinkWrap: true, // Makes GridView take only the space it needs
                physics:
                    const NeverScrollableScrollPhysics(), // Prevents GridView from scrolling independently
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: 2, // Number of items in the grid
                itemBuilder: (context, index) {
                  return ProductCard2(
                    productName: productList[index]['productName'],
                    price: productList[index]['price'],
                    discount: productList[index]['discount'],
                    image: productList[index]["image"],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
