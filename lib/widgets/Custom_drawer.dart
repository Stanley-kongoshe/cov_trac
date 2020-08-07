import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/head.jpg',
                  ),
                  radius: 35.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Stanley Kongoshe',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'About',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Help',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
