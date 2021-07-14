import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, bool currentVAlue, String updateBool) {
    return SwitchListTile(
      title: Text(title),
      value: currentVAlue,
      subtitle: Text(description),
      onChanged: (newValue) {
        setState(() {
          switch (updateBool) {
            case '_glutenFree':
              _glutenFree = newValue;
              break;
            case '_lactoseFree':
              _lactoseFree = newValue;
              break;
            case '_vegetarian':
              _vegetarian = newValue;
              break;
            case '_vegan':
              _vegan = newValue;
              break;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters;
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal Selection!',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  '_glutenFree',
                ),
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals',
                    _lactoseFree,
                    '_lactoseFree'),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _vegetarian,
                  '_vegetarian',
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                  '_vegan',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
