import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../models/dummy_data.dart.dart';
import '../Screens/filters_screen.dart';
import '../Screens/tabs_screen.dart';
import './Styles.dart';

class MainDrawer extends StatefulWidget {
  final Map<String, bool> filters;
  MainDrawer({this.filters});

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Map<String, bool> saveFilters;

  @override
  initState() {
    if (widget.filters != null) {
      saveFilters = widget.filters;
    } else {
      saveFilters = {
        'gluten': false,
        'lactose': false,
        'vegetarian': false,
        'vegan': false,
      };
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.black,
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 20,
                      child: Icon(
                        Icons.fastfood,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text(
                      " FOOD-FOOD",
                      style: TextStyle(
                          fontSize: 32.0,
                          color: Colors.white,
                          fontFamily: 'Cinzel',
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "Home",
              style: kMealItem,
            ),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) {
                return TabsScreen(
                  filters: saveFilters,
                );
              }),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "Filters",
              style: kMealItem,
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) {
                return FiltersScreen(
                  saveFilter: saveFilters,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
