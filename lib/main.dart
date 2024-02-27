// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/controll/newsappcubit/newsappcubit_cubit.dart';

import 'package:flutter_application_1/remote/dioHelper.dart';
import 'package:flutter_application_1/view/newsappScreen/bottomNAigationBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsappcubitCubit()..getBussiness(),
      child: BlocBuilder<NewsappcubitCubit, NewsappcubitState>(
          builder: (context, state) {
        var newsCubitObj = NewsappcubitCubit.get(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              elevation: 0.0,
              titleTextStyle: TextStyle(
                color: Colors.black,
              ),
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white,
              ),
              actionsIconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
            textTheme: const TextTheme(
              headline1: TextStyle(
                color: Colors.teal,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              elevation: 0.0,
              selectedIconTheme: IconThemeData(
                color: Colors.teal,
                size: 30.0,
              ),
              selectedLabelStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          darkTheme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 41, 35, 35),
            appBarTheme: const AppBarTheme(
              color: Colors.grey,
              elevation: 0.0,
              titleTextStyle: TextStyle(
                color: Colors.blue,
              ),
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: Colors.black,
              ),
              actionsIconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.grey,
              elevation: 0.0,
              selectedIconTheme: IconThemeData(
                color: Colors.blue,
                size: 30.0,
              ),
              selectedLabelStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            textTheme: const TextTheme(
              headline1: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          themeMode:
              (newsCubitObj.isLightMode) ? ThemeMode.light : ThemeMode.dark,
          home: NewsBotttomNavigation(),
        );
      }),
    );
  }
}
