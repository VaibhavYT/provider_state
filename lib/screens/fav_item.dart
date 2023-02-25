import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/favourite_provider.dart';

class FavouriteItemsScreen extends StatefulWidget {
  const FavouriteItemsScreen({super.key});

  @override
  State<FavouriteItemsScreen> createState() => _FavouriteItemsScreenState();
}

class _FavouriteItemsScreenState extends State<FavouriteItemsScreen> {
  @override
  Widget build(BuildContext context) {
    final favouritePovider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite List Items'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FavouriteItemsScreen()));
            },
            child: Icon(Icons.favorite),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouritePovider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          // value.addItem(index);
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                          // setState(() {});
                        },
                        title: Text('List $index'),
                        trailing: Icon(value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
