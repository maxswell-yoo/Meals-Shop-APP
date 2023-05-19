
import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreenIndex = 0;
  List<Map<String, Object>>? _screens;

  void initState() {
    super.initState();
    _screens = [
    {'title': 'Lista de Categorias', 'screen': const CategoriesScreen()},
    {'title': 'Meus Favoritos', 'screen': FavoriteScreen(widget.favoriteMeals)},
    ];
  }

  _selectScren(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens![_selectedScreenIndex]['title'] as String
        ),
      ),
      drawer: const MainDrawer(),
      body: _screens![_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScren,
        backgroundColor: Theme.of(context).canvasColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos'
          )
        ],
      ),
    );
  }
}