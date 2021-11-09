import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _createSectionImage(meal),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainerList(
                meal, context, _createIngredientsListView(meal, context)),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainerList(
                meal, context, _createStepsListView(meal)),
          ],
        ),
      ),
    );
  }

  ListView _createStepsListView(Meal meal) {
    return ListView.builder(
      itemCount: meal.steps.length,
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(meal.steps[index]),
          ),
          const Divider()
        ],
      ),
    );
  }

  Container _createSectionImage(Meal meal) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Image.network(
        meal.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Container _createSectionContainerList(
      Meal meal, BuildContext context, ListView listView) {
    return Container(
      width: 300,
      height: 220,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: listView,
    );
  }

  ListView _createIngredientsListView(Meal meal, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: meal.ingredients.length,
      itemBuilder: (ctx, index) => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Text(meal.ingredients[index]),
        ),
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  Container _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
