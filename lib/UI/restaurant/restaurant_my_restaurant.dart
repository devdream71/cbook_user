import 'package:cbook_user/UI/restaurant/restaurant.dart';
import 'package:cbook_user/UI/restaurant/resturant_invoice.dart';
import 'package:flutter/material.dart';

class RestaurantMyRestaurant extends StatelessWidget {
     RestaurantMyRestaurant({super.key});

   static const List<String> categoryList = [
    "Meal for",
    "Pandamart",
    "Pick-up",
    "pandago",
    "Meal",
  ];

   static const List<String> categoryListImage = [
    "assets/healthy-drink.png",
    "assets/soft_drink.png",
    "assets/dish.png",
    "assets/noodles.png",
    'assets/healthy-drink.png',
    "assets/soft_drink.png",
  ];

  final List<Map<String, dynamic>> foodItems = [
    {
      'image': 'assets/product_1.png', // Replace with actual image URL
      'name': 'Rice & Chicken Combo',
      'rating': 4.8,
      'price': 350,
      'time': '45-65 min',
    },
    {
      'image': 'assets/product_1.png',
      'name': 'Whopper Jr. & Nuggets Combo',
      'rating': 4.8,
      'price': 319,
      'time': '45-65 min',
    },
    {
      'image': 'assets/product_1.png',
      'name': 'Fried Chicken Combo',
      'rating': 4.8,
      'price': 344,
      'time': '45-65 min',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Restaurant & Food")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mojomder Store",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "84/8, Hatirpol, Shabag, Dhaka",
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const CircleAvatar(child: Icon(Icons.phone)),
                      InkWell(
                        onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ResturantInvoice()),
                            );
                          },
                        child: const Text(
                          "Click Bill",
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Row(
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
                    SizedBox(
                      height: 100,
                      width: double.maxFinite,
                      child: ListView.builder(
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
                                  CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.pink.shade100,
                                  child:
                                      Image.asset(categoryListImage[index], height: 35, width: 35,),
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
                    SizedBox(
                      height: 260,
                      width: double.maxFinite,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: foodItems.length,
                        itemBuilder: (context, index) {
                          final item = foodItems[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 3,
                              child: SizedBox(
                                width: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ClipRRect(
                                    //   borderRadius: BorderRadius.vertical(
                                    //       top: Radius.circular(12)),
                                    //   child: Image.asset(
                                    //     item['image'],
                                    //     height: 100,
                                    //     width: double.infinity,
                                    //     fit: BoxFit.fill,
                                    //   ),
                                    // ),
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12)),
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            item['image'],
                                            height: 100,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          Positioned(
                                            bottom: 4,
                                            right: 4,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 2),
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: const Text(
                                                "45 - 65 min",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 18,
                                                width: 18,
                                                child: Image.asset(
                                                  item['image'],
                                                  height: 4,
                                                  width: double.infinity,
                                                ),
                                              ),
                                              const Text(" Burger King..  "),
                                              const Icon(Icons.star,
                                                  size: 16,
                                                  color: Colors.orange),
                                              const SizedBox(width: 4),
                                              Text(
                                                item['rating'].toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            item['name'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            "Tk ${item['price']}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.pink,
                                            ),
                                          ),
                                          const Text(
                                            "🚴‍♂️ Free",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12)),
                                child: Image.asset(
                                  "assets/banner.jpg", // Replace with actual image URL
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Positioned(
                                top: 10,
                                right: 10,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.favorite_border,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "Tokyo Kitchen Dhanmondi",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Icon(Icons.star,
                                        color: Colors.orange, size: 18),
                                    Text(
                                      " 4.8 (100+)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "🍜 Noodles",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                const SizedBox(height: 6),
                                const Row(
                                  children: [
                                    SizedBox(width: 4),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                const Row(
                                  children: [
                                    Icon(Icons.timer,
                                        color: Colors.black54, size: 16),
                                    SizedBox(width: 4),
                                    Text(
                                      "55-75 min",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black54),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(Icons.money,
                                        color: Colors.black54, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      "৳ Free for first order",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.green),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    DiscountTag(
                                        "40% off: yumpanda", Colors.pink),
                                    const SizedBox(width: 6),
                                    DiscountTag(
                                        "12% off Tk. 50", Colors.orange),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            )
               
      )
          );
     
       
  }
}

class MenuItem {
  final String name;
  final String description;
  final String price;
  final String discount;

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
  });
}

class Restaurant {
  final String name;
  final String rating;
  final String deliveryTime;
  final List<MenuItem> menuItems;

  Restaurant({
    required this.name,
    required this.rating,
    required this.deliveryTime,
    required this.menuItems,
  });
}

class DiscountTag extends StatelessWidget {
  final String text;
  final Color color;

  DiscountTag(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
