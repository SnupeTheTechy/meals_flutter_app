import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> mainFilters;

  FilterScreen(this.saveFilters, this.mainFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.mainFilters['containsGluten'];
    _lactoseFree = widget.mainFilters['containsLactose'];
    _vegan = widget.mainFilters['notVegan'];
    _vegetarian = widget.mainFilters['notVegetarian'];
    super.initState();
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
                'containsGluten': _glutenFree,
                'containsLactose': _lactoseFree,
                'notVegan': _vegan,
                'notVegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
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
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              filterSwitch(
                changeFunction: (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
                optionClass: _glutenFree,
                subtitle: 'Only includes gluten-free meals',
                title: 'Gluten Free',
              ),
              filterSwitch(
                changeFunction: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
                optionClass: _lactoseFree,
                subtitle: 'Only includes lactose-free meals',
                title: 'Lactose Free',
              ),
              filterSwitch(
                changeFunction: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
                optionClass: _vegan,
                subtitle: 'Only includes vegan meals',
                title: 'Vegan',
              ),
              filterSwitch(
                changeFunction: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
                optionClass: _vegetarian,
                subtitle: 'Only includes vegetarian meals',
                title: 'Vegetarian',
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class filterSwitch extends StatefulWidget {
  const filterSwitch(
      {Key key,
      @required this.changeFunction,
      @required this.optionClass,
      @required this.subtitle,
      @required this.title})
      : super(key: key);

  final bool optionClass;
  final Function changeFunction;
  final String subtitle;
  final String title;

  @override
  State<filterSwitch> createState() => _filterSwitchState();
}

class _filterSwitchState extends State<filterSwitch> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.optionClass,
      onChanged: widget.changeFunction,
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
    );
  }
}
