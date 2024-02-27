import 'package:flutter/material.dart';
import 'package:flutter_application_1/controll/appStates.dart';
import 'package:flutter_application_1/view/formScreens/SignUpScreen.dart';
import 'package:flutter_application_1/view/formScreens/loginScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(WelcomeScreenState());
  int s = 10;

  void pushLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
    emit(LoginScreenState());
  }

  void pushSignUpScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
    emit(SignUPscreenState());
  }

  Widget VSpace({double height = 20}) {
    return SizedBox(
      height: height,
    );
  }

// ignore: non_constant_identifier_names
  Widget HSpace({double width = 20}) {
    return SizedBox(
      width: width,
    );
  }
}
