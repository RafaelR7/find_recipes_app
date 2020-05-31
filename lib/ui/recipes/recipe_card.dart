import 'package:auto_size_text/auto_size_text.dart';
import 'package:find_recipes/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key key, this.recipe}) : super(key: key);
  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.94,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            color: Colors.orange[50],
            child: Column(
              children: <Widget>[
                Image.network(
                  recipe.image,
                  fit: BoxFit.fill,
                ),
                // COLUMN 2 - RECIPE TITLE
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: AutoSizeText(
                      recipe.title,
                      style: Theme.of(context).textTheme.headline4,
                      minFontSize: 12,
                    ),
                  ),
                ),
                // COLUMN 3 - RECIPE INFO
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _infoItem(
                        item: Text('Score'),
                        value: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.star, color: Colors.orange),
                            Text(
                              ' ${recipe.score.toInt()}',
                            ),
                          ],
                        ),
                      ),
                      _verticalDivider(),
                      _infoItem(
                        item: Text('Health Score'),
                        value: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.heartbeat,
                              color: Colors.red,
                            ),
                            Text(' ${recipe.healthScore.toInt()}'),
                          ],
                        ),
                      ),
                      _verticalDivider(),
                      _infoItem(
                          item: Text('Vegetarian'),
                          value: recipe.vegetarian
                              ? FaIcon(FontAwesomeIcons.check,
                                  color: Colors.green)
                              : FaIcon(FontAwesomeIcons.times,
                                  color: Colors.red))
                    ],
                  ),
                ),
                // COLOUMN 4 -RECIPE INFO
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _infoItem(
                        item: FaIcon(FontAwesomeIcons.utensils,
                            color: Colors.grey[600]),
                        value: Text('${recipe.servings} people'),
                      ),
                      _verticalDivider(),
                      _infoItem(
                        item: FaIcon(FontAwesomeIcons.clock),
                        value: Text(' ${recipe.readyInMinutes} min'),
                      ),
                      _verticalDivider(),
                      _infoItem(
                          item: Text('Glutten Free'),
                          value: recipe.glutenFree
                              ? FaIcon(FontAwesomeIcons.check,
                                  color: Colors.green)
                              : FaIcon(FontAwesomeIcons.times,
                                  color: Colors.red))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _verticalDivider() {
    return Container(
      height: 50,
      child: VerticalDivider(
        color: Colors.grey,
      ),
    );
  }

  Expanded _infoItem({Widget item, Widget value}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          item,
          value,
        ],
      ),
    );
  }
}
