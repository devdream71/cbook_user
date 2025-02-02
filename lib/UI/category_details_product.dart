import 'package:cbook_user/utils/widget/auto_scroll_carousel.dart';
import 'package:cbook_user/utils/widget/product_card2.dart';
import 'package:flutter/material.dart';

class CategoryDetailsProduct extends StatelessWidget {
   CategoryDetailsProduct({super.key});

  static const List<String> categoryList = [
    "Men's",
    "Woman's",
    "Kids",
    "Shoes",
    "Jewelry",
    "Bags",
  ];

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
      "image": "assets/product_1.png",
    },
    {
      "productName": "Bluetooth Headphones",
      "price": 1200.00,
      "discount": 10,
      "image": "assets/product_1.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clothing"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Top Sub Category",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                  CategoryDetailsProduct()));
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection:
                        Axis.horizontal, // Makes the ListView horizontal
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 80, // Adjust the width of each item
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.pink,
                              child: Icon(Icons.category, color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              categoryList[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Mens",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
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
                    onPressed: (){},
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
              const Text(
                "Woman",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
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
                  return   ProductCard2(
                    onPressed: (){},
                     productName: productList[index]['productName'],
                  price: productList[index]['price'],
                  discount: productList[index]['discount'],
                  image: productList[index]["image"],
                  );
                },
              ),

              //==>
              const SizedBox(
                height: 10,
              ),
              const AutoScrollCarousel(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Kids",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
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
                  return   ProductCard2(
                    onPressed: (){},
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
