import 'package:flutter/material.dart';

class InvoiceDetailsPage extends StatefulWidget {
  const InvoiceDetailsPage({super.key});

  @override
  State<InvoiceDetailsPage> createState() => _InvoiceDetailsPageState();
}

class _InvoiceDetailsPageState extends State<InvoiceDetailsPage> {
  final List<Map<String, dynamic>> _products = [
    {"name": "Biskit", "unit": "Pk", "qty": 1, "price": 50.0},
    {"name": "Oil", "unit": "Botol", "qty": 1, "price": 120.0},
    {"name": "Rise", "unit": "Kg", "qty": 5, "price": 70.0},
    {"name": "Dim", "unit": "Pc", "qty": 10, "price": 12.5},
  ];

  double get totalAmount => _products.fold(
      0, (sum, product) => sum + (product["qty"] * product["price"]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mojomder Store"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Store and Client Info
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mojomder Store",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("84/8, Hatirpol, Shabag, Dhaka"),
                    ],
                  ),
                  Icon(Icons.phone, color: Colors.green),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                "Md. Jasin Uddin",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const Text("84/8, Hatirpol, Shabag, Dhaka\n01778344090"),
              const SizedBox(height: 4),
              const Divider(),
              const SizedBox(height: 4),

              // Product Table
              Table(
                border: TableBorder.all(color: Colors.black12),
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                },
                children: [
                  // Table Header
                  const TableRow(
                    decoration: BoxDecoration(color: Colors.grey),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Product/Item",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Unit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Qty",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Price",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Amount",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10)),
                      ),
                    ],
                  ),
                  ..._products.map((product) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(product["name"]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(product["unit"]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, size: 13),
                                onPressed: () {
                                  setState(() {
                                    if (product["qty"] > 1) {
                                      product["qty"]--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                product["qty"].toString(),
                                style: const TextStyle(fontSize: 14),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add, size: 13),
                                onPressed: () {
                                  setState(() {
                                    product["qty"]++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(product["price"].toStringAsFixed(2)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text((product["qty"] * product["price"])
                              .toStringAsFixed(2)),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
              const SizedBox(height: 4),
              const Divider(),

              // Total Section
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total: ${totalAmount.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Service Charge: 90",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Delivery Charges: 80",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Sub Total: ${(totalAmount + 90 + 80).toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Payment Section
              const Text(
                "Payment Type",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Radio(value: 1, groupValue: 1, onChanged: (value) {}),
                  const Text("Cash On Delivery"),
                ],
              ),
              Row(
                children: [
                  Radio(value: 2, groupValue: 1, onChanged: (value) {}),
                  const Text("Advance Payment"),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Note:"),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ],
              ),
              TextFormField(
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
              const SizedBox(height: 16),

              // Submit Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Pending",
                    style: TextStyle(color: Colors.orange),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';

// class InvoiceDetailsPage extends StatefulWidget {
//   const InvoiceDetailsPage({super.key});

//   @override
//   State<InvoiceDetailsPage> createState() => _InvoiceDetailsPageState();
// }

// class _InvoiceDetailsPageState extends State<InvoiceDetailsPage> {
//   // List of products with name, unit, price, and initial quantity
//   final List<Map<String, dynamic>> _products = [
//     {"name": "Biskit", "unit": "Pk", "qty": 1, "price": 50.0},
//     {"name": "Oil", "unit": "Botol", "qty": 1, "price": 120.0},
//     {"name": "Rise", "unit": "Kg", "qty": 5, "price": 70.0},
//     {"name": "Dim", "unit": "Pc", "qty": 10, "price": 12.5},
//   ];

//   double get totalAmount => _products.fold(
//       0, (sum, product) => sum + (product["qty"] * product["price"]));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mojomder Store"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Store and Client Info
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Mojomder Store",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       Text("84/8, Hatirpol, Shabag, Dhaka"),
//                     ],
//                   ),
//                   Icon(Icons.phone, color: Colors.green),
//                 ],
//               ),
//               const SizedBox(height: 4),
//               const Text(
//                 "Md. Jasin Uddin",
//                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//               ),
//               const Text("84/8, Hatirpol, Shabag, Dhaka\n01778344090"),
//               const SizedBox(height: 4),
//               const Divider(),
//               const SizedBox(height: 4),
//               // Product Table
//               Table(
//                 border: TableBorder.all(color: Colors.black12),
//                 columnWidths: const {
//                   0: FlexColumnWidth(2),
//                   1: FlexColumnWidth(1),
//                   2: FlexColumnWidth(2),
//                   3: FlexColumnWidth(1),
//                   4: FlexColumnWidth(1),
//                 },
//                 children: [
//                   // Table Header
//                   const TableRow(
//                     decoration: BoxDecoration(color: Colors.grey),
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text("Product/Item",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 10)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text("Unit",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 10)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text("Qty",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 10)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text("Price",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 10)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text("Amount",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 10)),
//                       ),
//                     ],
//                   ),
//                   // Product Rows
//                   ..._products.map((product) {
//                     return TableRow(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Text(product["name"]),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Text(product["unit"]),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(2.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.remove, size: 13),
//                                 onPressed: () {
//                                   setState(() {
//                                     if (product["qty"] > 1) {
//                                       product["qty"]--;
//                                     }
//                                   });
//                                 },
//                               ),
//                               Text(
//                                 product["qty"].toString(),
//                                 style: const TextStyle(fontSize: 14),
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.add, size: 13),
//                                 onPressed: () {
//                                   setState(() {
//                                     product["qty"]++;
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Text(product["price"].toStringAsFixed(2)),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Text((product["qty"] * product["price"])
//                               .toStringAsFixed(2)),
//                         ),
//                       ],
//                     );
//                   }).toList(),
//                 ],
//               ),
//               const SizedBox(height: 4),
//               const Divider(),
//               // Total Section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Total: ${totalAmount.toStringAsFixed(2)}",
//                         style: const TextStyle(
//                             fontSize: 14, fontWeight: FontWeight.bold),
//                       ),
//                       const Text(
//                         "Service Charge: 90",
//                         style: TextStyle(
//                             fontSize: 14, fontWeight: FontWeight.bold),
//                       ),
//                       const Text(
//                         "Delivery Charges: 80",
//                         style: TextStyle(
//                             fontSize: 14, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         "Sub Total: ${(totalAmount + 90 + 80).toStringAsFixed(2)}",
//                         style: const TextStyle(
//                             fontSize: 14, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               // Payment Section
//               const Text(
//                 "Payment Type",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Row(
//                 children: [
//                   Radio(value: 1, groupValue: 1, onChanged: (value) {}),
//                   const Text("Cash On Delivery"),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Radio(value: 2, groupValue: 1, onChanged: (value) {}),
//                   const Text("Advance Payment"),
//                 ],
//               ),
//               const SizedBox(height: 8),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("Note:"),
//                   IconButton(
//                     icon: const Icon(Icons.edit),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//               TextFormField(
//                 maxLines: 1, // Limits the field to 3 lines
//                 decoration: const InputDecoration(
//                   border:
//                       OutlineInputBorder(), // Adds a border around the TextFormField
//                   //labelText: 'Enter note', // Optional label for the field
//                   contentPadding:
//                       EdgeInsets.all(10), // Adds padding inside the box
//                 ),
//               ),
//               const Spacer(),
//               // Submit Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const Text(
//                     "Pending",
//                     style: TextStyle(color: Colors.orange),
//                   ),
//                   const SizedBox(
//                     width: 30,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style:
//                         ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                     child: const Text(
//                       "Submit",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }







//  import 'package:flutter/material.dart';

// class InvoiceDetailsPage extends StatefulWidget {
//   const InvoiceDetailsPage({super.key});

//   @override
//   State<InvoiceDetailsPage> createState() => _InvoiceDetailsPageState();
// }

// class _InvoiceDetailsPageState extends State<InvoiceDetailsPage> {
//   final List<Map<String, dynamic>> _products = [
//     {"name": "Biskit", "unit": "Pk", "qty": 1, "price": 50.0},
//     {"name": "Oil", "unit": "Botol", "qty": 1, "price": 120.0},
//     {"name": "Rise", "unit": "Kg", "qty": 5, "price": 70.0},
//     {"name": "Dim", "unit": "Pc", "qty": 10, "price": 12.5},
//   ];

//   double get totalAmount => _products.fold(
//       0, (sum, product) => sum + (product["qty"] * product["price"]));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mojomder Store"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Mojomder Store",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     Text("84/8, Hatirpol, Shabag, Dhaka"),
//                   ],
//                 ),
//                 Icon(Icons.phone, color: Colors.green),
//               ],
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Products",
//               style: TextStyle(
//                   fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
//             ),
//             const SizedBox(height: 8),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _products.length,
//                 itemBuilder: (context, index) {
//                   final product = _products[index];
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     elevation: 4,
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             flex: 2,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   product["name"],
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold, fontSize: 16),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   "Unit: ${product["unit"]}",
//                                   style: const TextStyle(
//                                       color: Colors.grey, fontSize: 14),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(Icons.remove_circle, 
//                                       color: Colors.redAccent),
//                                   onPressed: () {
//                                     setState(() {
//                                       if (product["qty"] > 1) {
//                                         product["qty"]--;
//                                       }
//                                     });
//                                   },
//                                 ),
//                                 Text(
//                                   product["qty"].toString(),
//                                   style: const TextStyle(
//                                       fontSize: 16, fontWeight: FontWeight.bold),
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(Icons.add_circle, 
//                                       color: Colors.green),
//                                   onPressed: () {
//                                     setState(() {
//                                       product["qty"]++;
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   "Price: ৳${product["price"].toStringAsFixed(2)}",
//                                   style: const TextStyle(fontSize: 14),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   "Total: ৳${(product["qty"] * product["price"]).toStringAsFixed(2)}",
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                       color: Colors.blueAccent),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const Divider(),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Total Amount:",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                   Text(
//                     "৳${totalAmount.toStringAsFixed(2)}",
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: Colors.green),
//                   ),
//                 ],
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   padding: const EdgeInsets.symmetric(vertical: 14)),
//               child: const Center(
//                 child: Text(
//                   "Submit",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
