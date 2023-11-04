import 'package:flutter/material.dart';
import 'package:devhacktesting/screens/authenticate/authenticate.dart';
import 'package:devhacktesting/screens/home/home_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either the Home or Authenticate widget
    return Authenticate();
  }
}
