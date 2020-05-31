import 'package:find_recipes/models/recipe_model.dart';
import 'package:find_recipes/stores/recipes_store.dart';
import 'package:find_recipes/ui/recipes/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Recipes extends StatelessWidget {
  const Recipes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RecipesStore recipesStore = RecipesStore();
    // recipesStore.fecthRecipes();

    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  'Recipes',
                  style: TextStyle(
                      color: Colors.white, fontSize: 40, fontFamily: 'Satisfy'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange[50],
                // borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                // border: Border.all(
                //     width: 3, color: Colors.white, style: BorderStyle.solid),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
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
    );
  }
}
