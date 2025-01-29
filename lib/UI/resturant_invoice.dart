import 'package:cbook_user/UI/my_store_order.dart';
import 'package:flutter/material.dart';

class ResturantInvoice extends StatefulWidget {
  const ResturantInvoice({super.key});

  @override
  State<ResturantInvoice> createState() => _ResturantInvoiceState();
}

class _ResturantInvoiceState extends State<ResturantInvoice> {
  final List<Map<String, dynamic>> _products = [
    {"name": "Biskit", "unit": "Pk", "qty": 1, "price": 50.0},
    {"name": "Oil", "unit": "Botol", "qty": 1, "price": 120.0},
    {"name": "Rise", "unit": "Kg", "qty": 4, "price": 70.0},
    {"name": "Dim", "unit": "Pc", "qty": 8, "price": 12.5},
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
                  Column(
                    children: [
                    Icon(Icons.phone, color: Colors.green),
                  Text("Date: 29.01.25"),
                  Text("Invoice: DT 102"),
                    ],
                  )
                  

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

              const SizedBox(height: 4),

              const Text(
                "Home",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Physical Delivery",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Table Delivery",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StoreTransactionsScreen()));
                    },
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
