import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/my_htpps_overrides.dart';
import 'screens/categories_screen.dart';
import 'utils/app_routes.dart';

void main() {
   HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        AppRoutes.HOME: (context) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL:(context) => const MealDetailScreen()
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => const CategoriesScreen()
        );
      },
    );
  }
}
