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
  dynamic function,
  bool isLight = true,
  var keyboardType,
}) {
  return Container(
    height: height,
    width: width,
    child: TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      onChanged: function,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.black,
          // color: isLight ? Colors.black : Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
          // color: isLight ? Colors.black : Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(r),
          ),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.black,
          // color: isLight ? Colors.black : Colors.white,
        ),
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
