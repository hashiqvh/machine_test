import 'package:flutter/material.dart';

class Constants {
  //Colors for theme
  static Color backgroundColor = const Color.fromRGBO(38, 44, 65, 1);
  static Color primaryColor = const Color.fromRGBO(27, 32, 52, 1);
  static Color butttonColor = const Color.fromRGBO(235, 128, 78, 1);
  //TextStyle
  static TextStyle textStyle1(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(
            color: Colors.white30,
          ));
  static TextStyle textStyle2(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.merge(const TextStyle(
            color: Colors.white,
          ));
}
