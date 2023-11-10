import 'package:flutter/material.dart';

class HomePageIcon extends StatelessWidget {
  final String IconName;
  final IconColor;
  final String IconImageName;
  // final String IconRoute;
  const HomePageIcon({
    super.key,
    required this.IconName,
    required this.IconColor,
    required this.IconImageName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: IconColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes the position of the shadow
            ),
          ],
        ),
        child: Column(children: [
          // image
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
              child: Image.asset(IconImageName, height: 100, width: 100)),

          // text
          Text(
            IconName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ]),
      ),
    );
  }
}
