import 'package:flutter/material.dart';
import '../screens/drawer/filters.dart';

class MenuBars extends StatefulWidget {
  @override
  _MenuBarsState createState() => _MenuBarsState();
}

class _MenuBarsState extends State<MenuBars> {
  Widget buildListTitle(String title, IconData leadngIcon, IconData trailingIcon ,Function tapHandler) {
    return ListTile(
      leading: Icon(
        leadngIcon,
        size: 26,
        color: Colors.black,
      ),
      trailing: Icon(
        trailingIcon,
        size: 26,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      onTap: tapHandler,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/food.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              child: Center(
                child: Text(
                  "Cooking \n   App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),

              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildListTitle('meals', Icons.restaurant, Icons.arrow_forward ,() {
                  Navigator.of(context).pushNamed('/');
                }),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                  thickness: 1.5,
                ),
                buildListTitle('filters', Icons.settings, Icons.arrow_forward , () {
                  Navigator.of(context).pushNamed(FiltersPage.routeName);
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
