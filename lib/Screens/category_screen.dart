import 'package:flutter/material.dart';
import '../Widgets/Styles.dart';
import '../models/meal.dart';
import '../models/dummy_data.dart.dart';
import '../Widgets/category_item.dart';

class CategoryScreen extends StatefulWidget {
  final List<Meal> filteredMeals;
  final Function toggleFavourite;
  final Function isFavourite;

  CategoryScreen({this.filteredMeals, this.toggleFavourite, this.isFavourite});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Meal> _availableList;

  @override
  void initState() {
    setState(() {
      if (widget.filteredMeals != null) {
        _availableList = widget.filteredMeals;
      } else {
        _availableList = DUMMY_MEALS;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbdbdbd),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: GridView(
            children: DUMMY_CATEGORIES
                .map((catName) => CategoryItem(
                      id: catName.id,
                      title: catName.title,
                      color: catName.color,
                      image: catName.image,
                      filteredList: _availableList,
                      toggleFavourite: widget.toggleFavourite,
                      isFavourite: widget.isFavourite,
                    ))
                .toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
          ),
        ),
      ),
    );
  }
}
