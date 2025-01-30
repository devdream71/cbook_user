import 'package:flutter/material.dart';

class Transaction {
  final String storeName;
  final String location;
  final int amount;
  final String status;

  Transaction({
    required this.storeName,
    required this.location,
    required this.amount,
    required this.status,
  });
}

class RestaurantransactionsScreen extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      storeName: 'Mojomder Store',
      location: 'Hatirpol, Shabag, Dhaka',
      amount: 3500,
      status: 'Complete',
    ),
    Transaction(
      storeName: 'Mojomder Store',
      location: 'Hatirpol, Shabag, Dhaka',
      amount: 500,
      status: 'Pending',
    ),
    Transaction(
      storeName: 'Mojomder Store',
      location: 'Hatirpol, Shabag, Dhaka',
      amount: 600,
      status: 'Submit',
    ),
  ];

  RestaurantransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Restaurant'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "My Restaurant",
              style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return Card(
                  margin: const EdgeInsets.all(4.0),
                  child: ListTile(
                    title: Text(
                      transaction.storeName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(transaction.location),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${transaction.amount} BDT'),
                        Text(
                          transaction.status,
                          style: TextStyle(
                            color: transaction.status == 'Pending'
                                ? Colors.orange
                                : transaction.status == 'Submit'
                                    ? Colors.blue
                                    : Colors.green,
                          ),
                        ),
                      ],
                    ),
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
