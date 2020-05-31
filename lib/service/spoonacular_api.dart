import 'dart:convert';

import 'package:find_recipes/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SpoonacularAPI {
  static const baseUrl = 'https://api.spoonacular.com/recipes/random?number=25';
  static const key = 'apiKey=cf419aa96ca54455b40013854e78b6b3';

  Future<List<RecipeModel>> fecthRecipes() async {
    Response res = await get('$baseUrl&$key');
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var decodedData = data['recipes'] as List;
      List<RecipeModel> recipeList = decodedData
          .map<RecipeModel>((json) => RecipeModel.fromJson(json))
          .toList();
      return recipeList;
    } else {
      debugPrint('API Error');
      throw "Error, request fail";
    }
  }
}
