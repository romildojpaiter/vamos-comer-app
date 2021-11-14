import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_botton_screen.dart';
import 'package:meals/utils/app_routes.dart';

import 'models/meal.dart';
import 'screens/categories_screen.dart';
import 'package:meals/data/dummy_data.dart';

void main() => runApp(VamosCozinharApp());

class VamosCozinharApp extends StatefulWidget {
  @override
  State<VamosCozinharApp> createState() => _VamosCozinharAppState();
}

class _VamosCozinharAppState extends State<VamosCozinharApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGluttenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  _getRoutes(BuildContext ctx) {
    return {
      AppRoutes.HOME: (ctx) => const TabsBottonScreen(),
      // AppRoutes.HOME: (ctx) => const TabsScreen(),
      AppRoutes.CATEGORIES_MEALS: (ctx) =>
          CategoriesMealsScreen(meals: _availableMeals),
      AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
      AppRoutes.SETTINGS: (ctx) => SettingsScreen(
            onSettingsChanged: _filterMeals,
            settings: settings,
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              caption: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      initialRoute: AppRoutes.HOME,
      routes: _getRoutes(context),
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return const CategoriesScreen();
          },
        );
      },
    );
  }
}
