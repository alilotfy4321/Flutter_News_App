// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controll/newsappcubit/newsappcubit_cubit.dart';
import 'package:flutter_application_1/networkServer/local/cachHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizPref extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsApptCubit, NewsappcubitState>(
        builder: (context, state) {
      var cubit = NewsApptCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: Text('Pref'),
        ),
        body: Column(
          children: [
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () {
                CachHelper.SaveUserKey('userName', 11);
              },
              child: Text('SaveUserName'),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${cubit.userName}'),
                SizedBox(
                  width: 20,
                ),
                Text('${cubit.count}'),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () {
                CachHelper.getUserValue(
                    key: 'userName', userName: cubit.userName);
                cubit.count++;
              },
              child: Text('getUserName'),
            ),
          ],
        ),
      );
    });
  }
}
