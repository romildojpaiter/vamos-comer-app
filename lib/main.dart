import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

import 'screens/categories_screen.dart';

void main() => runApp(VamosCozinharApp());

class VamosCozinharApp extends StatelessWidget {
  // first line

  _getRoutes(BuildContext ctx) {
    return {
      AppRoutes.HOME: (ctx) => const TabsScreen(),
      AppRoutes.CATEGORIES_MEALS: (ctx) => const CategoriesMealsScreen(),
      AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
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
      /* Declarações abaixo utilizadas para direcionar as telas da aplicação 
      para rotas conhecidas */
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/alguma-coisa') {
      //     return null;
      //   } else if (settings.name == '/outra-coisa') {
      //     return null;
      //   } else {
      //     return MaterialPageRoute(
      //       builder: (_) {
      //         return CategoriesScreen();
      //       },
      //     );
      //   }
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return CategoriesScreen();
          },
        );
      },
    );
  }
}
