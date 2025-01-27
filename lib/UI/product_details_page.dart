import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int count = 1;
  int price = 450;
  int discount = 150;

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/product_1.png', // Replace with your image asset
                  width: 150,
                  height: 100,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ladies Bag',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$price',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.lato().fontFamily),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: const Text(
                        '50% OFF',
                        style: TextStyle(color: Colors.white),
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
                        if (count > 1) {
                          setState(() {
                            count--;
                          });
                        } else {
                          debugPrint("you cant go below 1");
                        }

                        print(count);
                      }, // Decrease quantity logic
                    ),
                    Text(
                      '$count',
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Colors.blue),
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                        print(count);
                      }, // Increase quantity logic
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Baby clothes are soft, lightweight garments designed to be comfortable and gentle on a baby\'s delicate skin. They come in a variety of styles and fabrics, like cotton, which is breathable and soft, making it ideal for babies. Typical items include',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 36),

            _buildRowWithUnderline("Price", "$price"),
            _buildRowWithUnderline("Qty", "${count}"),
            _buildRowWithUnderline("Total", "${price * count}"),
            _buildRowWithUnderline("Discount", "$discount"),
            _buildRowWithUnderline("Amount", "${(price * count) + discount}"),

            // Table(
            //   columnWidths: const {
            //     0: FlexColumnWidth(1),
            //     1: FlexColumnWidth(3),
            //   },
            //   border: TableBorder.all(color: Colors.grey),
            //   children: [
            //     const TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('Price', style: TextStyle(fontSize: 14)),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('450', style: TextStyle(fontSize: 14)),
            //         ),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         const Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('Qty', style: TextStyle(fontSize: 14)),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child:
            //               Text('$count', style: const TextStyle(fontSize: 14)),
            //         ),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         const Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text('Total', style: TextStyle(fontSize: 14)),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text('${count * price}',
            //               style: const TextStyle(fontSize: 14)),
            //         ),
            //       ],
            //     ),
            //     const TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('Discount', style: TextStyle(fontSize: 14)),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('150', style: TextStyle(fontSize: 14)),
            //         ),
            //       ],
            //     ),
            //     const TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('Amount', style: TextStyle(fontSize: 14)),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('1200', style: TextStyle(fontSize: 14)),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),

            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 150.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Final Submit',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('Add to Card',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16))
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
              Text(
                label,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
