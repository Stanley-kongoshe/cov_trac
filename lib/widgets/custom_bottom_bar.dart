import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: ClipPath(
            clipper: NavBarClipper(),
            child: Container(
              height: 68,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.teal,
                    Colors.teal.shade900,
                  ])),
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildNavItem(Icons.bubble_chart, false),
              SizedBox(width: 1),
              _buildNavItem(Icons.landscape, true),
              SizedBox(width: 1),
              _buildNavItem(Icons.brightness_3, false),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Focus',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 1,
              ),
              Text(
                'Relax',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 1,
              ),
              Text(
                'Sleep',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

_buildNavItem(IconData icon, bool active) {
  return CircleAvatar(
    radius: 30,
    backgroundColor: Colors.teal.shade900,
    child: CircleAvatar(
      radius: 25.0,
      backgroundColor:
          active ? Colors.white.withOpacity(0.9) : Colors.transparent,
      child: Icon(
        icon,
        color: active ? Colors.black : Colors.white.withOpacity(0.9),
      ),
    ),
  );
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo(3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, 12 * sw / 12, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
