import 'package:cbook_user/UI/invoice_details.dart';
import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Online Store"),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.phone, color: Colors.green),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const InvoiceDetailsPage()));
                      },
                      child: const Text(
                        "Click Invoice",
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ),
                    const Text(
                      "00-00.00",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                )
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text("Category",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14))),
                Expanded(
                    flex: 3,
                    child: Text("Product/Item Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14))),
                Expanded(
                    child: Text("Unit",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14))),
                Expanded(
                    child: Text("Stock",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14))),
                Expanded(
                    child: Text("Price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14))),
                Expanded(
                    child: Text("Order",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14))),
              ],
            ),
          ),

          // Table Rows
          Expanded(
            child: ListView.builder(
              itemCount: 20, // Number of rows
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color:
                        index % 2 == 0 ? Colors.white : Colors.blueGrey.shade50,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Expanded(flex: 2, child: Text("Category")),
                      Expanded(flex: 3, child: Text("Product ${index + 1}")),
                      const Expanded(child: Text("Unit")),
                      Expanded(
                        child: Text(
                          index % 3 == 0
                              ? "Out"
                              : index % 3 == 1
                                  ? "12"
                                  : "Stock",
                          style: TextStyle(
                            color: index % 3 == 0
                                ? Colors.red
                                : index % 3 == 1
                                    ? Colors.black
                                    : Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const Expanded(child: Text("Price")),
                      const Expanded(child: Text("Order")),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
