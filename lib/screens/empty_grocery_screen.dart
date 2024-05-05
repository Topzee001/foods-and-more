import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //add empty image
          Flexible(
              child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset(
              'assets/fooderlich_assets/empty.png',
            ),
          )),
          SizedBox(
            height: 50,
          ),
          //add empty screen title
          Text(
            'No Groceries',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: 16,
          ),
          //add empty screen subtitle
          const Text(
            'Shopping for ingredients?\n Tap the + button to write them down!',

            textAlign: TextAlign.center,
            // style: Theme.of(context).textTheme.bodyLarge,
          ),
          //add browse recipes button
          MaterialButton(
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.lightGreenAccent.shade700,
            onPressed: () {
              //TODO: goto recipe tab
              Provider.of<TabManager>(context, listen: false).gotoRecipes();
            },
            child: Text(
              'Browse Recipes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
    );
  }
}
