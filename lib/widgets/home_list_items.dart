import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  final Icon infoicon = Icon(
    Icons.info,
  );

  final Map homeList = {
    'Testing Centers': '/testing_centre',
    'Precautions': '/precautions',
    'Testing Procedures': '/testing_procedures',
    'Covid-19 Education': '/covid19_education',
    'Covid-19 Statistics': '/stats'
  };

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: ListView.builder(
        itemCount: homeList.length,
        itemBuilder: (BuildContext context, int index) {
          String key = homeList.keys.elementAt(index);
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, homeList[key]);
            },
            child: Container(
              height: 60.0,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              margin: EdgeInsets.only(
                  top: 15.0, bottom: 10.0, right: 20.0, left: 10.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    key,
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  infoicon,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
