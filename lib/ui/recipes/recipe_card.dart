import 'package:auto_size_text/auto_size_text.dart';
import 'package:find_recipes/models/recipe_model.dart';
import 'package:find_recipes/ui/recipes/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key key, this.recipe}) : super(key: key);
  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RecipeDetails(recipe: recipe)),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              color: Colors.orange[50],
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                          height: 220,
                          child: Center(child: CircularProgressIndicator())),
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: recipe.image,
                      ),
                    ],
                  ),
                  // COLUMN 2 - RECIPE TITLE
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: AutoSizeText(
                          recipe.title,
                          style: Theme.of(context).textTheme.headline4,
                          minFontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  // COLUMN 3 - RECIPE INFO
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _infoItem(
                          item: Text(
                            'Score',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          value: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FaIcon(
                                FontAwesomeIcons.star,
                                color: Colors.orange,
                              ),
                              Text(
                                ' ${recipe.score.toInt()}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                        _verticalDivider(),
                        _infoItem(
                          item: Text(
                            'Health Score',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          value: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FaIcon(
                                FontAwesomeIcons.heartbeat,
                                color: Colors.red,
                              ),
                              Text(
                                ' ${recipe.healthScore.toInt()}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // COLOUMN 4 -RECIPE INFO chips
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            buildChip(
                                icon: FaIcon(
                                  FontAwesomeIcons.seedling,
                                  size: 16,
                                  color: Colors.green,
                                ),
                                color: Colors.green,
                                item: "Vegan",
                                isTrue: recipe.vegan),
                            buildChip(
                                icon: FaIcon(
                                  FontAwesomeIcons.leaf,
                                  size: 16,
                                  color: Colors.green,
                                ),
                                color: Colors.green,
                                item: "Vegatarian",
                                isTrue: recipe.vegetarian),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            buildChip(
                                icon: FaIcon(
                                  FontAwesomeIcons.pagelines,
                                  size: 16,
                                  color: Colors.brown,
                                ),
                                color: Colors.green,
                                item: "Gluten Free",
                                isTrue: recipe.glutenFree),
                            buildChip(
                                icon: FaIcon(
                                  FontAwesomeIcons.wineBottle,
                                  size: 16,
                                  color: Colors.brown,
                                ),
                                color: Colors.green,
                                item: "Dairy Free",
                                isTrue: recipe.dairyFree),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Chip buildChip({FaIcon icon, Color color, String item, bool isTrue}) {
    return Chip(
      backgroundColor: Colors.orange[100],
      avatar: icon,
      label: isTrue
          ? Text('$item')
          : Text(
              '$item',
              style: TextStyle(decoration: TextDecoration.lineThrough),
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
        children: <Widget>[item, value, SizedBox(height: 20)],
      ),
    );
  }
}
