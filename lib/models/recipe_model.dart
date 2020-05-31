import 'package:find_recipes/models/ingredient_model.dart';

class RecipeModel {
  String title;
  String image;
  double score;
  double healthScore;
  String instructions;
  int servings;
  int readyInMinutes;
  bool vegetarian;
  bool glutenFree;
  List<IngredientModel> ingredients;

  RecipeModel({
    this.title,
    this.image,
    this.score,
    this.healthScore,
    this.instructions,
    this.servings,
    this.readyInMinutes,
    this.vegetarian,
    this.glutenFree,
    this.ingredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['extendedIngredients'] as List;
    List<IngredientModel> ingredientList =
        list.map((i) => IngredientModel.fromJson(i)).toList();

    return RecipeModel(
      title: parsedJson['title'],
      image: parsedJson['image'],
      score: parsedJson['spoonacularScore'],
      healthScore: parsedJson['healthScore'],
      instructions: parsedJson['instructions'],
      servings: parsedJson['servings'],
      readyInMinutes: parsedJson['readyInMinutes'],
      vegetarian: parsedJson['vegetarian'],
      glutenFree: parsedJson['glutenFree'],
      ingredients: ingredientList,
    );
  }
}
