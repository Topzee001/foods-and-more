import 'package:flutter/material.dart';
import 'package:fooderlich_scroll/models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  final SimpleRecipe recipe;
  const RecipeThumbnail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                recipe.dishImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            recipe.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            recipe.duration,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
