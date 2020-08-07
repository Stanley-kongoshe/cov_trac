import 'package:flutter/material.dart';
import 'package:covtrac/widgets/home_list_items.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covtrac/widgets/Custom_drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'CovTrac',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 55.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
              child: HomeList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        height: 50,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 22,
            color: Colors.white,
          ),
          Icon(
            Icons.history,
            size: 22,
            color: Colors.white,
          ),
          Icon(
            FontAwesomeIcons.solidNewspaper,
            size: 20,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          print('helloo there');
        },
        animationDuration: Duration(
          milliseconds: 200,
        ),
        animationCurve: Curves.bounceInOut,
        index: 0,
      ),
    );
  }
}
