import 'package:cbook_user/provider/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Card"),
      ),
      body: Consumer<MyCardptovider>(
        builder: (context, provider, child) {
          if (provider.cartItems.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: provider.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = provider.cartItems[index];
                    return ListTile(
                      leading: SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset(item['image'])),
                      title: Text(item['productName']),
                      subtitle:
                          Text('Price: \$${item['price'] * item['quantity']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                provider.decrementQuantity(item);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            item['quantity'].toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          // Display the quantity
                          const SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                provider.incrementQuantity(item);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            child: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                provider.removeProductFromCart(item);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Order",
                          style: TextStyle(color: Colors.green),
                        )),
                    const Text(
                      "Total Price:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$${provider.getTotalPrice().toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}





// import 'package:cbook_user/provider/card_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class MyCard extends StatelessWidget {
//   const MyCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("My Card"),
//       ),
//       body: Consumer<MyCardptovider>(
//         builder: (context, provider, child) {
//           if (provider.cartItems.isEmpty) {
//             return const Center(child: Text('Your cart is empty.'));
//           }
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: provider.cartItems.length,
//                   itemBuilder: (context, index) {
//                     final item = provider.cartItems[index];
//                     return ListTile(
//                       leading: SizedBox(
//                           height: 60, width: 60, child: Image.asset(item['image'])),
//                       title: Text(item['productName']),
//                       subtitle: Text('Price: \$${item['price'] * item['quantity']}'),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.remove),
//                             onPressed: () {
//                               provider.decrementQuantity(item);
//                             },
//                           ),
//                           Text(item['quantity'].toString()), // Display the quantity
//                           IconButton(
//                             icon: const Icon(Icons.add),
//                             onPressed: () {
//                               provider.incrementQuantity(item);
//                             },
//                           ),
//                           IconButton(
//                             icon: const Icon(
//                               Icons.delete,
//                               color: Colors.red,
//                             ),
//                             onPressed: () {
//                               provider.removeProductFromCart(item);
//                             },
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
                 
//               ),
              
              
//             ],
//           );


//         },
//       ),
//     );
//   }
// }