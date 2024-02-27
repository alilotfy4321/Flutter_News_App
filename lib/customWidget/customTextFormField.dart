import 'package:flutter/material.dart';

Widget CustomTextFormField({
  // ignore: prefer_const_constructors
  IconData icon = Icons.phone,
  double height = 40.0,
  double width = 300,
  double r = 15.0,
  String hint = 'Enter your phone',
  String label = 'phone',
  required TextEditingController controller,
}) {
  return Container(
    height: height,
    width: width,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(r),
          ),
        ),
        prefixIcon: Icon(icon),
        hintText: hint,
        labelText: label,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'write any thing';
        }
        return null;
      },
    ),
  );
}
