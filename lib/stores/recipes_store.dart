import 'package:find_recipes/models/recipe_model.dart';
import 'package:find_recipes/service/spoonacular_api.dart';
import 'package:mobx/mobx.dart';

part 'recipes_store.g.dart';

class RecipesStore = _RecipesBase with _$RecipesStore;

abstract class _RecipesBase with Store {
  @observable
  List<RecipeModel> recipes;

  @action
  fecthRecipes() async {
    recipes = await SpoonacularAPI().fecthRecipes();
  }
}
