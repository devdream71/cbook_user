import 'package:cbook_user/UI/invoice_screen.dart';
import 'package:cbook_user/UI/my_store_order.dart';
import 'package:flutter/material.dart';

class StoreListScreen extends StatelessWidget {
  const StoreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(right: 5.0),
          child: Text(
            "Dhanmondi,Dhaka,Bangladesh",
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        leading: const Icon(
          Icons.location_on,
          color: Colors.blue,
        ),
        actions:  [
          InkWell(
            onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreTransactionsScreen()));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                "My Store",
                style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const InvoiceScreen()));
        },
        child: ListView.builder(
          itemCount: 10, // Number of rows
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(4),
                color: index % 2 == 0
                    ? Colors.grey.withOpacity(0.1)
                    : Colors.white, // Alternate row colors
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left Section: Store Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Mojomder Store",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              index % 2 == 0 ? " Open" : " Closed",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: index % 2 == 0
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "84/8, Hatirpol, Shabag, Dhaka",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                    // Right Section: Categories
                    const Text(
                      "Confectionary, Modi,\nJoylary",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
