import 'package:flutter/material.dart';
import 'package:flutter_application_1/customWidget/customScaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Customscaffold(
      child: Center(child: Text('LOgin')),
    );
  }
}
