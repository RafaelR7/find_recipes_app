import 'package:auto_size_text/auto_size_text.dart';
import 'package:find_recipes/models/recipe_model.dart';
import 'package:find_recipes/ui/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      backgroundColor: Colors.orange[50],
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                height: 380,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: widget.recipe.image,
                ),
              ),
              Positioned(
                bottom: 290,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 10,
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        spreadRadius: 0.1,
                        offset: Offset(0, 2.0),
                      )
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          child: Center(
                            child: AutoSizeText(
                              '${widget.recipe.title}',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            recipeInfoItem(
                              item: FaIcon(FontAwesomeIcons.utensils,
                                  color: Colors.black87),
                              value: Text("6"),
                            ),
                            recipeInfoItem(
                              item: FaIcon(FontAwesomeIcons.clock,
                                  color: Colors.black87),
                              value: Text("67 min"),
                            ),
                            FaIcon(FontAwesomeIcons.bookmark, color: Colors.red)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange[50],
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

  Row recipeInfoItem({Widget item, Widget value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        item,
        SizedBox(
          width: 10,
        ),
        value
      ],
    );
  }
}
