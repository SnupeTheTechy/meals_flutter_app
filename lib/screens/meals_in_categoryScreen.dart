import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../models/meal.dart';

class MealsInCategoryScreen extends StatefulWidget {
  static const routeName = '/mealsInCategory';
  final List<Meal> availableMeals;

  MealsInCategoryScreen(this.availableMeals);

  @override
  State<MealsInCategoryScreen> createState() => _MealsInCategoryScreenState();
}

class _MealsInCategoryScreenState extends State<MealsInCategoryScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  // final categoryId;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];
    displayedMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
            title: displayedMeals[index].title,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
