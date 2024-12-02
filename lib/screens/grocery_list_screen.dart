import 'package:flutter/material.dart';
import 'package:fooderlich_scroll/components/grocery_tile.dart';

import '../models/grocery_manager.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({super.key, required this.manager});
  final GroceryManager manager;

  @override
  Widget build(BuildContext context) {
    //TODO: Replace with listview
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            final item = groceryItems[index];
            //TODO: wrap in a dismissable
            //TODO: wrap in an inkwell
            return GroceryTile(
              item: item,
              key: Key(item.id),
              onComplete: (change) {
                if (change != null) {
                  manager.completeItem(index, change);
                }
              },
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16,
            );
          },
          itemCount: groceryItems.length),
    );
  }
}
