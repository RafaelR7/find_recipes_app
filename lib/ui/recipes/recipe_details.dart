import 'package:find_recipes/models/recipe_model.dart';
import 'package:find_recipes/ui/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({Key key, this.recipe}) : super(key: key);
  final RecipeModel recipe;

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.recipe.image,
              ),
              Positioned(
                bottom: 190,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.orange[50],
            height: 80,
            child: Text(
              '${widget.recipe.title}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange[50],
                // borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                children: <Widget>[
                  TabBar(
                    indicatorColor: Colors.deepOrangeAccent,
                    controller: _controller,
                    tabs: [
                      Tab(child: Text('Ingredients')),
                      Tab(child: Text('Instructions')),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _controller,
                      children: <Widget>[
                        ListView.builder(
                          padding: const EdgeInsets.all(30),
                          itemCount: widget.recipe.ingredients.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                '• ${widget.recipe.ingredients[index].original}',
                                style: Styles.recipeDetailsBody,
                              ),
                            );
                          },
                        ),
                        SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            child: Text(
                              '${widget.recipe.instructions}',
                              style: Styles.recipeDetailsBody,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
