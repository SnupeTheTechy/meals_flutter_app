import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          drawerListTiles(
            icon: Icons.restaurant,
            text: 'Meals',
            tapHandler: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          drawerListTiles(
              icon: Icons.settings,
              text: 'Filters',
              tapHandler: () {
                Navigator.of(context)
                    .pushReplacementNamed(FilterScreen.routeName);
              }),
        ],
      ),
    );
  }
}

class drawerListTiles extends StatelessWidget {
  const drawerListTiles({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.tapHandler,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function tapHandler;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }
}
