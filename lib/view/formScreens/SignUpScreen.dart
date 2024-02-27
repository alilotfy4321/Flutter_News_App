import 'package:flutter/material.dart';
import 'package:flutter_application_1/customWidget/customButton.dart';
import 'package:flutter_application_1/customWidget/customScaffold.dart';
import 'package:flutter_application_1/customWidget/customTextFormField.dart';
import 'package:flutter_application_1/customWidget/vhSpace.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Customscaffold(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Text('1'),
                )),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      const Text(
                        'SignUp',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                        ),
                      ),
                      VSpace(),
                      CustomTextFormField(
                        controller: nameController,
                        icon: Icons.person,
                        hint: 'Enter your Name',
                        label: 'Name',
                      ),
                      VSpace(),
                      CustomTextFormField(
                        controller: emailController,
                        icon: Icons.email,
                        hint: 'Enter your Email',
                        label: 'Email',
                      ),
                      VSpace(),
                      CustomTextFormField(
                        controller: phoneController,
                        icon: Icons.phone,
                      ),
                      VSpace(),
                      Container(
                        width: 150,
                        child: CustomButton(
                            child: Text('SignUp'), function: () {}),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
