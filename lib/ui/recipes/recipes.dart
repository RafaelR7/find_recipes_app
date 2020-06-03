import 'package:find_recipes/models/ingredient_model.dart';
import 'package:find_recipes/models/recipe_model.dart';
import 'package:find_recipes/stores/recipes_store.dart';
import 'package:find_recipes/ui/recipes/recipe_card.dart';
import 'package:find_recipes/ui/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Recipes extends StatefulWidget {
  const Recipes({Key key}) : super(key: key);

  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  final RecipesStore recipesStore = RecipesStore();

  @override
  void initState() {
    super.initState();
    // recipesStore.fecthRecipes();
  }

  @override
  Widget build(BuildContext context) {
    RecipeModel recipeTest = RecipeModel()
      ..title = 'Test Recipe macarron'
      ..ingredients = [
        IngredientModel()..original = '2 cups of sugar',
        IngredientModel()..original = '4 cups of flour',
        IngredientModel()..original = '2 tsp of cinnamon',
        IngredientModel()..original = '2 cups of milk',
        IngredientModel()..original = '1 cups of butter',
      ]
      ..image = 'https://spoonacular.com/recipeImages/621398-556x370.jpg'
      ..score = 50.0
      ..healthScore = 22.5
      ..servings = 2
      ..readyInMinutes = 45
      ..vegetarian = true
      ..glutenFree = true
      ..instructions =
          '*Wash rice by rubbing the rice between your palms in a bowl of water and draining the water till clear.Blend tomatoes, pepper and garlic and bring to boil till the excess water dries up.Chop OnionsHeat up vegetable oil and pour in chopped onions and fry. Pour in the can of tomato puree and fry.Pour in blended tomato and pepper mix into the pot and stir in. Pour in salt, dry pepper, curry, thyme, bay leaves and maggi cubes.Allow it to simmer on low heat for 3 minutes.Reduce the heat to the lowest level and pour in the washed rice. Pour in the water and stir and leave on low heat for 20 minutes or till the rice is soft.Tip: To get the party rice flavor, increase the heat on the rice and burn the bottom of the pot with the pot covered and stir the rice after 3 minutes of burning.Stir the rice and serve with any protein of your choice.  // <![CDATA[(adsbygoogle = window.adsbygoogle || []).push({});// ]]&gt;A video I shared on Instagram recently';
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    'Recipes',
                    style: Styles.homeTitle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Observer(
                    builder: (_) {
                      // if (recipesStore.recipes == null) {
                      //   return Center(child: CircularProgressIndicator());
                      // }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 25,
                        // itemCount: recipesStore.recipes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RecipeCard(recipe: recipeTest);
                          // return RecipeCard(
                          //     recipe: recipesStore.recipes[index]);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
