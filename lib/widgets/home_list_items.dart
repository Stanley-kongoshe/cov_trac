import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  final Icon infoicon = Icon(
    Icons.info,
  );

  final List<String> homeList = [
    'Testing Centers',
    'Precautions',
    'Testing Procedures',
    'Covid-19 Education'
  ];

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
          return GestureDetector(
            onTap: () {},
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
                    homeList[index],
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
