import 'package:flutter/material.dart';
import 'package:fooderlich_scroll/components/components.dart';

import '../models/models.dart';

class RecipesGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;
  const RecipesGridView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16,
        top: 16,
      ),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 500),
        itemBuilder: (context, index) {
          final SimpleRecipe = recipes[index];
          return RecipeThumbnail(recipe: SimpleRecipe);
        },
      ),
    );
  }
}
