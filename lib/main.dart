// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/controll/newsappcubit/newsappcubit_cubit.dart';
import 'package:flutter_application_1/learn/sharedPref.dart';
import 'package:flutter_application_1/networkServer/local/cachHelper.dart';
import 'package:flutter_application_1/networkServer/remote/dioHelper.dart';
import 'package:flutter_application_1/styles/themes.dart';

import 'package:flutter_application_1/view/newsappScreen/bottomNAigationBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CachHelper.init();
  var fromCach;
  fromCach = CachHelper.getUserValue(key: 'isLight');

  runApp(MyApp(fromCach));
}

class MyApp extends StatelessWidget {
  final fromCachValue;
  MyApp(this.fromCachValue);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsApptCubit()
        ..changeMode(fromCach: fromCachValue)
        ..getBussiness(),
      child: BlocBuilder<NewsApptCubit, NewsappcubitState>(
          builder: (context, state) {
        var newsCubitObj = NewsApptCubit.get(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode:
              (newsCubitObj.isLightMode) ? ThemeMode.light : ThemeMode.dark,
          home: NewsBotttomNavigation(),
        );
      }),
    );
  }
}
