import 'package:flutter/material.dart';

class InvoiceDetailsPage extends StatelessWidget {
  const InvoiceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mojomder Store"),
      ),
      body: Padding(
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("84/8, Hatirpol, Shabag, Dhaka"),
                  ],
                ),
                const Icon(Icons.phone, color: Colors.green),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Md. Jasim Uddin Nizami"),
                    Text("374, Hatirpol, Shabag, Dhaka"),
                    Text("01778344090"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Invoice",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("27/01/2025"),
                  ],
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            // Product Table
            Table(
              border: TableBorder.all(color: Colors.black),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
                4: FlexColumnWidth(1),
              },
              children: [
                const TableRow(
                  decoration: BoxDecoration(color: Colors.grey),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Product/ Item",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Unit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Qty",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Price",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Amount",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                  ],
                ),
                ...[
                  ["Biskit", "Pk", "1", "50", "50"],
                  ["Oil", "Botol", "1", "120", "120"],
                  ["Rise", "Kg", "5", "70", "350"],
                  ["Dim", "Pc", "10", "12.50", "125"],
                ].map(
                  (item) => TableRow(
                    children: item
                        .map(
                          (data) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Total Section
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total: 645"),
                    Text("Service Charge: 90"),
                    Text("Delivery Charges: 80"),
                    Text("Sub Total: 815"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Declaration and Notes

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
              maxLines: 3, // Limits the field to 3 lines
              decoration: const InputDecoration(
                border:
                    OutlineInputBorder(), // Adds a border around the TextFormField
                //labelText: 'Enter note', // Optional label for the field
                contentPadding:
                    EdgeInsets.all(10), // Adds padding inside the box
              ),
            ),
            const Spacer(),
            // Payment Type
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              ],
            ),
            const SizedBox(height: 16),
            // Buttons
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
    );
  }
}
