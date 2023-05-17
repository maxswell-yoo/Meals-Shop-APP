import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes da Refeição'
        ),
      ),
      body: Center(
        child: Text(
          meal.title!
        ),
      ),
    );
  }
}