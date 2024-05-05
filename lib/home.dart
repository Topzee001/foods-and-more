import 'package:flutter/material.dart';
import 'package:fooderlich_scroll/screens/explore_screen.dart';
import 'package:fooderlich_scroll/screens/grocery_screen.dart';
import 'package:fooderlich_scroll/screens/recipe_screen.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    // TODO: Replace with ExploreScreen
    ExploreScreen(),
    // TODO: Replace with RecipesScreen
    RecipeScreen(),
    GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade300,
            title: Text(
              'Just Foods',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          // TODO: replace body
          body: pages[tabManager.selectedTab],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey.shade300,
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
              tabManager.goToTab(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Recipes',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'To Buy',
              ),
            ],
          ),
        );
      },
    );
  }
}
