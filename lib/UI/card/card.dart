// MyCard Page

import 'package:cbook_user/UI/order_page.dart';
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
      body: Consumer<MyCardptovider>(builder: (context, provider, child) {
        if (provider.cartItems.isEmpty) {
          return const Center(child: Text('Your cart is empty.'));
        }
        double totalPrice = provider.getTotalPrice(); // Calculate total price here
        
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
                    subtitle: Text('Price: \$${item['price'] * item['quantity']}'),
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


                        // CircleAvatar(
                        //   child: IconButton(
                        //     icon: const Icon(Icons.remove),
                        //     onPressed: () {
                        //       provider.decrementQuantity(item);
                        //     },
                        //   ),
                        // ),
                        // const SizedBox(width: 4),
                        // Text(item['quantity'].toString(),
                        //     style: const TextStyle(
                        //         fontSize: 14, fontWeight: FontWeight.bold)),
                        // const SizedBox(width: 4),
                        // CircleAvatar(
                        //   child: IconButton(
                        //     icon: const Icon(
                        //       Icons.delete,
                        //       color: Colors.red,
                        //     ),
                        //     onPressed: () {
                        //       provider.removeProductFromCart(item);
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Pass real data to OrderPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderPage(
                            cartItems: provider.cartItems,
                            totalPrice: totalPrice,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      shadowColor: Colors.green.withOpacity(0.3),
                      elevation: 5,
                    ),
                    label: const Text(
                      "Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Price:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$${totalPrice.toStringAsFixed(2)} (${provider.cartItems.length})", 
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}




// import 'package:cbook_user/UI/order_page.dart';
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
//                     final itemLength = provider.cartItems.length;
//                     return ListTile(
//                       leading: SizedBox(
//                           height: 60,
//                           width: 60,
//                           child: Image.asset(item['image'])),
//                       title: Text(item['productName']),
//                       subtitle:
//                           Text('Price: \$${item['price'] * item['quantity']}'),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           CircleAvatar(
//                             child: IconButton(
//                               icon: const Icon(Icons.remove),
//                               onPressed: () {
//                                 provider.decrementQuantity(item);
//                               },
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 4,
//                           ),
//                           Text(
//                             item['quantity'].toString(),
//                             style: const TextStyle(
//                                 fontSize: 14, fontWeight: FontWeight.bold),
//                           ),
//                           // Display the quantity
//                           const SizedBox(
//                             width: 4,
//                           ),
//                           CircleAvatar(
//                             child: IconButton(
//                               icon: const Icon(Icons.add),
//                               onPressed: () {
//                                 provider.incrementQuantity(item);
//                               },
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 4,
//                           ),
//                           CircleAvatar(
//                             child: IconButton(
//                               icon: const Icon(
//                                 Icons.delete,
//                                 color: Colors.red,
//                               ),
//                               onPressed: () {
//                                 provider.removeProductFromCart(item);
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         // Add your order functionality here
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const OrderPage()));
//                       },
//                       icon: const Icon(
//                         Icons.shopping_bag,
//                         color: Colors.white,
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 12, horizontal: 20),
//                         shadowColor: Colors.green.withOpacity(0.3),
//                         elevation: 5,
//                       ),
//                       label: const Text(
//                         "Order",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius:
//                               BorderRadius.circular(12), // Rounded corners
//                           border: Border.all(
//                             color: Colors.grey.shade300, // Border color
//                             width: 1, // Border width
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.shade300,
//                               blurRadius: 8,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               "Total Price:",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               "\$${provider.getTotalPrice().toStringAsFixed(2)} (${provider.cartItems.length})", // Use provider to get the total price
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
