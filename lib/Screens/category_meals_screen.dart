import 'package:flutter/material.dart';
import 'package:mealsapp/Widgets/meal_item.dart';
import '../Widgets/Styles.dart';
import '../models/dummy_data.dart.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  final String id;
  final String title;
  final String image;
  final List<Meal> filteredList;
  final Function toggleFavourite;
  final Function isFavourite;

  CategoryMealsScreen(
      {this.id,
      this.title,
      this.image,
      this.filteredList,
      this.toggleFavourite,
      this.isFavourite});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> categoryMeals;
  removeItem(String mealId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void initState() {
    categoryMeals = widget.filteredList.where((meal) {
      return meal.categories.contains(widget.id);
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbdbdbd),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: kAppbar,
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            toggleFavourite: widget.toggleFavourite,
            isFavourite: widget.isFavourite,
          );
        },
        itemCount: categoryMeals.length,
      )),
    );
  }
}
