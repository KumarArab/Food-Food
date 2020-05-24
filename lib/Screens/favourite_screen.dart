import 'package:flutter/material.dart';
import 'package:mealsapp/Widgets/Styles.dart';
import '../Widgets/meal_item.dart';
import '../models/meal.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal> myFavourites;
  final Function toggleFunction;
  final Function isFavourite;
  FavouriteScreen({this.myFavourites, this.toggleFunction, this.isFavourite});

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.myFavourites.isEmpty) {
      return Scaffold(
          body: Center(
        child: Text(
          "No Favourites yet!",
          style: kTabTitle,
        ),
      ));
    } else {
      return SafeArea(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.myFavourites[index].id,
            title: widget.myFavourites[index].title,
            imageUrl: widget.myFavourites[index].imageUrl,
            duration: widget.myFavourites[index].duration,
            complexity: widget.myFavourites[index].complexity,
            affordability: widget.myFavourites[index].affordability,
            toggleFavourite: widget.toggleFunction,
            isFavourite: widget.isFavourite,
          );
        },
        itemCount: widget.myFavourites.length,
      ));
    }
  }
}
