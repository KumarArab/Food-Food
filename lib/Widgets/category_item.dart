import 'package:flutter/material.dart';
import '../Screens/category_meals_screen.dart';
import '../models/meal.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;
  final List<Meal> filteredList;
  final Function toggleFavourite;
  final Function isFavourite;
  CategoryItem(
      {this.id,
      this.title,
      this.color,
      this.image,
      this.filteredList,
      this.toggleFavourite,
      this.isFavourite});

  moveToCategoryMealsScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return CategoryMealsScreen(
        id: id,
        title: title,
        image: image,
        filteredList: filteredList,
        toggleFavourite: toggleFavourite,
        isFavourite: isFavourite,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => moveToCategoryMealsScreen(context),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: FractionallySizedBox(
                heightFactor: 0.9,
                widthFactor: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
