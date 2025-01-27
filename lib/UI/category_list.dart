import 'package:cbook_user/UI/category_details_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  static const List<String> categoryList = [
    "Clothing",
    "Accessories",
    "Electronics",
    "Health",
    "Beauty",
    "Sports",
    "Outdoors",
    "Toys",
    "Games",
    "Food",
    "Beverages",
    "Books",
    "Pet ",
    "Office "
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   automaticallyImplyLeading: false,
      //   title: const Row(
      //     children: [
      //       Icon(
      //         Icons.pin_drop,
      //         color: Colors.white,
      //       ),
      //       SizedBox(
      //         width: 5,
      //       ),
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text('Dhanmondi, Dhaka',
      //               style: TextStyle(fontSize: 16, color: Colors.white)),
      //           Text('Bangladesh',
      //               style: TextStyle(fontSize: 12, color: Colors.white)),
      //         ],
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: const Icon(
      //           Icons.search,
      //           color: Colors.white,
      //         )),
      //     IconButton(
      //         onPressed: () {},
      //         icon: const Icon(
      //           Icons.shopping_cart,
      //           color: Colors.white,
      //         )),
      //     IconButton(
      //         onPressed: () {},
      //         icon: const Icon(
      //           Icons.notifications,
      //           color: Colors.white,
      //         )),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Horizontal ListView
            const Row(
              children: [
                Icon(
                  Icons.widgets,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Category",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100, // Constrain the height of the horizontal list
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CategoryDetailsProduct()));
                },
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
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Trending Category",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            // Space between lists
            // Vertical ListView
            Expanded(
              child: ListView.builder(
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Row(
                      children: [
                        const Icon(Icons.trending_up, color: Colors.pink),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          categoryList[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
