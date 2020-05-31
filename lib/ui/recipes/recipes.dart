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
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
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
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
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
                        itemBuilder: (BuildContext context, int index) {
                          RecipeModel recipeTest = RecipeModel()
                            ..title = 'Test Recipe macarron'
                            ..image =
                                'https://spoonacular.com/recipeImages/621398-556x370.jpg'
                            ..score = 50.0
                            ..healthScore = 22.5
                            ..servings = 2
                            ..readyInMinutes = 45
                            ..vegetarian = true
                            ..glutenFree = true;
                          return RecipeCard(recipe: recipeTest);
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
