import 'package:find_recipes/ui/find_recipe/find_recipe.dart';
import 'package:find_recipes/ui/my_recipes/my_recipes.dart';
import 'package:find_recipes/ui/recipes/recipes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> _children;
  final pageController = PageController();

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _children = [Recipes(), FindRecipe(), MyRecipes()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: PageView(
        children: _children,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu, color: Colors.white),
            title: Text(
              'Recipes',
              style: TextStyle(color: Colors.white, fontFamily: 'Satisfy'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white),
            title: Text(
              'Find Recipe',
              style: TextStyle(color: Colors.white, fontFamily: 'Satisfy'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, color: Colors.white),
            title: Text(
              'My Recipes',
              style: TextStyle(color: Colors.white, fontFamily: 'Satisfy'),
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          pageController.jumpToPage(index);
        },
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
