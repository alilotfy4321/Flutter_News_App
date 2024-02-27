import 'package:flutter/material.dart';

class Customscaffold extends StatelessWidget {
  final child;
   Customscaffold({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      // ignore: prefer_const_constructors
      body: Stack(
        children: [
          Image.asset(
            'assets/images/welcome1.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
    ;
  }
}
