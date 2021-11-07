import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/utils/app_routes.dart';

import 'screens/categories_screen.dart';

void main() => runApp(VamosCozinharApp());

class VamosCozinharApp extends StatelessWidget {
  // first line

  _getRoutes(BuildContext ctx) {
    return {
      AppRoutes.HOME: (ctx) => CategoriesScreen(),
      AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
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
    );
  }
}
