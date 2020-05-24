import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/Styles.dart';
import '../models/dummy_data.dart.dart';
import '../models/meal.dart';

const String bullet = "\u2022 ";

class MealDetails extends StatefulWidget {
  final String mealId;
  final Function toggleFavourite;
  final Function isFavourite;

  MealDetails({this.mealId, this.toggleFavourite, this.isFavourite});

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  bool tab = true;

  Widget generateSubtitle(String name) {
    return Text(
      "$name:",
      style: TextStyle(
          fontSize: 28,
          color: Colors.black54,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600),
    );
  }

  Widget generateMealImage(BuildContext context, Meal selectedMeal) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      child: Hero(
        tag: "pic${widget.mealId}",
        child: Container(
          child: Image.network(
            selectedMeal.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == widget.mealId);

    return Scaffold(
      backgroundColor: Color(0xffbdbdbd),
      body: Stack(
        children: [
          generateMealImage(context, selectedMeal),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                    color: Color(0xffeeeeee),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedMeal.title,
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      endIndent: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tab = true;
                                  });
                                },
                                child: Text(
                                  "Ingredients",
                                  style: kSubtitle.copyWith(
                                      color: tab ? Colors.black : Colors.grey),
                                ),
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                width: 1,
                                thickness: 1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tab = false;
                                  });
                                },
                                child: Text(
                                  "Directions",
                                  style: kSubtitle.copyWith(
                                      color: tab ? Colors.grey : Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          child: ListView.builder(
                            itemBuilder: (ctx, index) {
                              return Card(
                                color: Color(0xffeeeeee),
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 5),
                                  child: Text(
                                    tab
                                        ? "$bullet ${selectedMeal.ingredients[index]}"
                                        : "${index + 1} ${selectedMeal.steps[index]}",
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: "Montserrat"),
                                  ),
                                ),
                              );
                            },
                            itemCount: tab
                                ? selectedMeal.ingredients.length
                                : selectedMeal.steps.length,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor:
              widget.isFavourite(widget.mealId) ? Colors.black : Colors.grey,
          child: Icon(widget.isFavourite(widget.mealId)
              ? Icons.star
              : Icons.star_border),
          onPressed: () {
            setState(() {
              widget.toggleFavourite(widget.mealId);
            });
          }),
    );
  }
}
