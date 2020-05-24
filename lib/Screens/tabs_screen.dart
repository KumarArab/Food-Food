import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';
import './category_screen.dart';
import './favourite_screen.dart';
import '../Widgets/Styles.dart';
import '../models/meal.dart';
import '../models/dummy_data.dart.dart';

class TabsScreen extends StatefulWidget {
  final Map<String, bool> filters;
  TabsScreen({this.filters});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  Map<String, bool> constfilters;
  static List<Meal> _availableMeals;
  static List<Meal> favouriteMeals = [];
  @override
  void initState() {
    if (widget.filters != null) {
      constfilters = widget.filters;
    } else {
      constfilters = {
        'gluten': false,
        'lactose': false,
        'vegetarian': false,
        'vegan': false
      };
    }
    setFilters(constfilters);
    super.initState();
  }

  void _toggleFavourites(String mealId) {
    final existingIndex =
        favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavourite(String mealId) {
    return favouriteMeals.any((meal) => meal.id == mealId);
  }

  void setFilters(Map<String, bool> filterData) {
    print("filtering started");
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filterData['gluten'] && !meal.isGlutenFree) {
          print(false);
          return false;
        }
        if (filterData['lactose'] && !meal.isLactoseFree) {
          print(false);
          return false;
        }
        if (filterData['vegetarian'] && !meal.isVegetarian) {
          print(false);
          return false;
        }
        if (filterData['vegan'] && !meal.isVegan) {
          print(false);
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          _selectedScreen == 0 ? "CATEGORIES" : "FAVOURITES",
          style: kAppbar,
        ),
      ),
      drawer: MainDrawer(
        filters: widget.filters,
      ),
      body: _selectedScreen == 0
          ? CategoryScreen(
              filteredMeals: _availableMeals,
              toggleFavourite: _toggleFavourites,
              isFavourite: _isFavourite,
            )
          : FavouriteScreen(
              myFavourites: favouriteMeals,
              toggleFunction: _toggleFavourites,
              isFavourite: _isFavourite,
            ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        onTap: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: Text(
              "Categories",
              style: kTabTitle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            title: Text(
              "Favourites",
              style: kTabTitle,
            ),
          ),
        ],
        currentIndex: _selectedScreen,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
      ),
    );
  }

  int _selectedScreen = 0;

  void _selectedTab(int value) {
    setState(() {
      _selectedScreen = value;
    });
  }
}
