import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/my_htpps_overrides.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';
import 'utils/app_routes.dart';

void main() {
   HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
          final filterGluten = settings.isGlutenFree! && !meal.isGlutenFree!;
          final filterLactose = settings.isLactoseFree! && !meal.isLactoseFree!;
          final filterVegan = settings.isVegan! && !meal.isVegan!;
          final filterVegetarian = settings.isVegetarian! && !meal.isVegetarian!;
          return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;

      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal) 
      ? _favoriteMeals.remove(meal) 
      : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.lightGreen,
          secondary: Colors.blue
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (context) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (context) => SettingsScreen(settings, _filterMeals)
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => const CategoriesScreen()
        );
      },
    );
  }
}
