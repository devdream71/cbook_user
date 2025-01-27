import 'package:cbook_user/UI/product_details_page.dart';
import 'package:cbook_user/utils/widget/auto_scroll_carousel.dart';
import 'package:cbook_user/utils/widget/product_card2.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                return const ProductCard2();
              },
            ),
          ),
        ]),
      ),
    );
  }
}

