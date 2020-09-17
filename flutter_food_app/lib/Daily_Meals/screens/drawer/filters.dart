import 'package:flutter/material.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filter_page';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersPage(this.currentFilters, this.saveFilters);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree = false;
  bool _vegitarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegitarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      activeColor: Theme.of(context).primaryColor,
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegitarian,
              };
              widget.saveFilters(selectedFilters);
              Navigator.of(context).pushNamed('/');
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Adjust Your Meal'),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile('GlutenFree', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchListTile('Vegitarian', _vegitarian, (newValue) {
                  setState(() {
                    _vegitarian = newValue;
                  });
                }),
                buildSwitchListTile('Vegan', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                buildSwitchListTile('LactoseFree', _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
