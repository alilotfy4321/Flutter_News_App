import 'package:flutter/material.dart';
import 'package:flutter_application_1/learn/textfeildcubit/textfeildcubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TxtFormFeid extends StatelessWidget {
  @override
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextfeildcubitCubit(),
      child: BlocBuilder<TextfeildcubitCubit, TextfeildcubitState>(
        builder: (context, state) {
          var obj = TextfeildcubitCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        obscureText: obj.obsecureText,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          labelText: 'ali',
                          hintText: 'lotfy',
                          suffixIcon: IconButton(
                            onPressed: () {
                              print(obj.is_Password);
                              obj.changesuffix();
                              print(obj.is_Password);
                            },
                            icon: obj.suffex,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
