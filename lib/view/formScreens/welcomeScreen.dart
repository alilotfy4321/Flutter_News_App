// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controll/appCubit.dart';
import 'package:flutter_application_1/controll/appStates.dart';
import 'package:flutter_application_1/customWidget/customScaffold.dart';
import 'package:flutter_application_1/customWidget/customButton.dart';
import 'package:flutter_application_1/customWidget/vhSpace.dart';
import 'package:flutter_application_1/view/formScreens/SignUpScreen.dart';
import 'package:flutter_application_1/view/formScreens/loginScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit controller = context.read<AppCubit>();
          return Customscaffold(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'welcome Screen ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Welcome Mr ali lotf this will leed to our app ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    20.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          function: () {
                            controller.pushLoginScreen(context);

                            print(state.toString());

                            print(controller.s);
                            print('Login');
                          },
                        ),
                      ),
                      HSpace(
                        width: 50,
                      ),
                      Expanded(
                        child: CustomButton(
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          function: () {
                            controller.pushSignUpScreen(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
