import 'package:flutter/scheduler.dart';

enum Complexity { Simple, Medium, Difficult }

enum Cost { Cheap, Fair, Expensive }

class Meal {
  //
  final String id;
  final String title;
  final String imageUrl;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.duration,
    required this.complexity,
    required this.cost,
  });

  /**
   * Método get responsável por recuperar de forma clara qual a complexidade.
   */
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simples';
      case Complexity.Medium:
        return 'Média';
      case Complexity.Difficult:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.Cheap:
        return 'Barato';
      case Cost.Expensive:
        return 'Caro';
      case Cost.Fair:
        return 'Justo';
      default:
        return 'Desconhecida';
    }
  }
}
