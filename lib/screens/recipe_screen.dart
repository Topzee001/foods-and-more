import 'package:flutter/material.dart';
import 'package:fooderlich_scroll/api/mock_fooderlich_service.dart';
import 'package:fooderlich_scroll/components/recipes_grid_view.dart';

import '../models/simple_recipe.dart';
//import '../models/models.dart';
//import '../components/components.dart';
//import '../api/mock_fooderlich_service.dart';

class RecipeScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();

  RecipeScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getRecipes(),
        builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RecipesGridView(recipes: snapshot.data ?? []);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
