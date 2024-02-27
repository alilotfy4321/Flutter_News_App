// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

dynamic child;
Widget CustomButton({
  @required child,
  double height = 40,
  double radius = 20,
  required VoidCallback function,
}) {
  return Container(
    height: height,
    child: ElevatedButton(
      onPressed: function,
      child: child,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    ),
  );
}
