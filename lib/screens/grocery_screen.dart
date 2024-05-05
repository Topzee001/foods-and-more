import 'package:flutter/material.dart';
import 'package:fooderlich_scroll/screens/empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: replace with EmptyGroceryScreen
    return Consumer<GroceryManager>(builder: (context, manager, child) {
      if (manager.groceryItems.isNotEmpty) {
        //TODO: add GroceryListScreen
        return Container();
      } else {
        //TODO: add a scaffold widget
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //TODO: Present GroceryItemScreen
              // const EmptyGroceryScreen(); //not meant to be here
            },
            child: const Icon(Icons.add),
          ),
          //body: buildGroceryScreen(),
        );
      }
    });
  }
  //TODO: add buildGrocerySCreen
}
