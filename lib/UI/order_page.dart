// OrderPage

import 'package:cbook_user/UI/conform_order_page.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final double totalPrice;

  const OrderPage(
      {super.key, required this.cartItems, required this.totalPrice});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _addressController = TextEditingController();
  final _couponController = TextEditingController();
  double _discount = 0.0;
  String? _selectedPaymentMethod = 'COD';
  String? _selectedAddress;
  double _deliveryCharge = 20.00;
  double _tax = 20.0;
  //  String? _selectedAddress = 'Selected Address';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Order Summary
              const Text(
                'Order Summary',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add item details
                      ...widget.cartItems.map((item) {
                        return Text(
                          "${item['productName']}: \$${item['price'] * item['quantity']}",
                          style: const TextStyle(fontSize: 16),
                        );
                      }).toList(),

                      const Divider(),

                      // Total price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Price:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(
                            '\$ ${(widget.totalPrice - (widget.totalPrice * (_discount / 100))).toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ],
                      ),
                      const Divider(),

                      // Delivery Charge and Tax
                      const Text("Delivery Charge: \$20.00",
                          style: TextStyle(fontSize: 16)),
                      const Text("Tax: \$20.00",
                          style: TextStyle(fontSize: 16)),

                      const Divider(),

                      // Grand Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Grand Total Price:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(
                            '\$ ${(widget.totalPrice + _deliveryCharge + _tax - (widget.totalPrice * (_discount / 100))).toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 2. Apply Coupon
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Apply Discount Coupon',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('(if you have discount coupon, apply here)',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _couponController,
                decoration: InputDecoration(
                  labelText: 'Coupon Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _discount = 10; // Example: Apply 10% discount
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Apply Coupon',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const SizedBox(height: 16),

              // 3. Delivery Address (remaining logic stays the same)
              const Text('Select Delivery Address',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),

              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    border:
                        Border.all(color: Colors.grey.shade300), // Border color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 6,
                        offset: const Offset(0, 4), // Shadow effect
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: DropdownButton<String>(
                      value: _selectedAddress,
                      hint: const Text(
                        "Select Address", // Placeholder text when nothing is selected
                        style: TextStyle(color: Colors.grey),
                      ),
                      isExpanded:
                          true, // Ensures the dropdown takes up all available width
                      items: [
                        'Home',
                        'Work',
                        'Parent Home', // Example addresses, replace with actual dynamic data
                      ].map((address) {
                        return DropdownMenuItem<String>(
                          value: address,
                          child: Text(address),
                        );
                      }).toList(),
                      onChanged: (String? newAddress) {
                        setState(() {
                          _selectedAddress = newAddress;
                        });
                      },
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.green), // Custom dropdown icon
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Add a new address functionality
                    _selectedAddress = "New Address";
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Add New Address',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const SizedBox(height: 16),

              // 4. Payment Method
              const Text('Select Payment Method',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              // 4. Payment Method

              const SizedBox(height: 8),
              Column(
                children: [
                  RadioListTile<String>(
                    value: 'COD',
                    groupValue: _selectedPaymentMethod,
                    title: const Text('Cash on Delivery'),
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    value: 'Card',
                    groupValue: _selectedPaymentMethod,
                    title: const Text('Credit/Debit Card'),
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 5. Confirm Order
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmOrderPage(
                                selectedAddress: "123 Main Street, NY",
                                totalAmount: 59.99)));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Confirm Order',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
