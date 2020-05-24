import 'package:flutter/material.dart';
import 'package:mealsapp/main.dart';
import './tabs_screen.dart';
import '../Widgets/Styles.dart';
import '../Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Map<String, bool> saveFilter;

  FiltersScreen({this.saveFilter});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree, _lactoseFree, _vegetarian, _vegan;

  @override
  void initState() {
    _glutenFree = widget.saveFilter['gluten'];
    _lactoseFree = widget.saveFilter['lactose'];
    _vegetarian = widget.saveFilter['vegetarian'];
    _vegan = widget.saveFilter['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subTitle, bool value, Function function) {
    return SwitchListTile(
      value: value,
      onChanged: function,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 22, fontFamily: "Montserrat", color: Colors.black),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
            fontSize: 16, fontFamily: "Montserrat", color: Colors.black54),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FILTERS",
          style: kAppbar,
        ),
        backgroundColor: Colors.black,
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 500,
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    "Gluten-Free",
                    "Only includes gluten-free meals",
                    _glutenFree,
                    (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    "Lactose-Free",
                    "Only includes lactose-free meals",
                    _lactoseFree,
                    (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    "Vegetarian",
                    "Only includes vegetarian meals",
                    _vegetarian,
                    (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    "Vegan",
                    "Only includes vegan meals",
                    _vegan,
                    (value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                        "Clear",
                        style:
                            TextStyle(fontSize: 16, fontFamily: "Montserrat"),
                      ),
                      color: Colors.grey,
                      onPressed: () {
                        setState(() {
                          widget.saveFilter['gluten'] = false;
                          widget.saveFilter['lactose'] = false;
                          widget.saveFilter['vegetarian'] = false;
                          widget.saveFilter['vegan'] = false;
                          _glutenFree = false;
                          _lactoseFree = false;
                          _vegetarian = false;
                          _vegan = false;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                        "Apply",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            color: Colors.white),
                      ),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) {
                              return TabsScreen(
                                filters: {
                                  'gluten': _glutenFree,
                                  'lactose': _lactoseFree,
                                  'vegetarian': _vegetarian,
                                  'vegan': _vegan
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
