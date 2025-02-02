import 'package:cbook_user/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Products'),
        // backgroundColor: Colors.lightBlue,
      ),
      body: favoritesProvider.favorites.isEmpty
          ? const Center(child: Text("No favorite products yet!"))
          : ListView.builder(
              itemCount: favoritesProvider.favorites.length,
              itemBuilder: (context, index) {
                final productData = favoritesProvider.favorites.elementAt(index);
                final productName = productData['name']!;
                final imagePath = productData['image']!;

                return ListTile(
                  leading: Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(productName),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      favoritesProvider.removeFromFavorites(productName);
                    },
                  ),
                );
              },
            ),
    );
  }
}

