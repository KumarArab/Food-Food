import 'package:flutter/material.dart';
import './Screens/tabs_screen.dart';
import './Screens/category_screen.dart';
import './models/dummy_data.dart.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };

  @override
  initState() {
    print(filters['gluten']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.black,
        ),
        home: TabsScreen(),
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) {
            return TabsScreen(
              filters: filters,
            );
          });
        });
  }
}
