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
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Recipes(),
    FindRecipe(),
    MyRecipes()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
