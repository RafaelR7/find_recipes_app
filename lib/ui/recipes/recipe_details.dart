import 'package:find_recipes/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({Key key, this.recipe}) : super(key: key);

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(child: Center(child: Text('${recipe.title}'))),
    );
  }
}
