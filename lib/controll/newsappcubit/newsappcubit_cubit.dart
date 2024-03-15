// ignore_for_file: prefer_const_constructors, prefer_is_empty, unused_element, prefer_const_declarations, curly_braces_in_flow_control_structures, unnecessary_null_comparison, unused_local_variable, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/networkServer/local/cachHelper.dart';
import 'package:flutter_application_1/networkServer/remote/dioHelper.dart';
import 'package:flutter_application_1/view/formScreens/SignUpScreen.dart';
import 'package:flutter_application_1/view/formScreens/loginScreen.dart';
import 'package:flutter_application_1/view/formScreens/welcomeScreen.dart';
import 'package:flutter_application_1/view/newsappScreen/bussinessScreen.dart';
import 'package:flutter_application_1/view/newsappScreen/scienceScreen.dart';
import 'package:flutter_application_1/view/newsappScreen/searchScreen.dart';
import 'package:flutter_application_1/view/newsappScreen/sportsScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

part 'newsappcubit_state.dart';

class NewsApptCubit extends Cubit<NewsappcubitState> {
  NewsApptCubit() : super(NewsAppCubitInitial());
  static NewsApptCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool isLightMode = false;
  IconData modeIcon = Icons.brightness_2_rounded;
  List<Widget> screens = [
    BussinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  changeIndex(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsAppCubitChangeState(currentIndex));
  }

  var cachedValue;
  changeMode({var fromCach}) {
    print('the last value before exit app is $fromCach');
    isLightMode = !isLightMode;
    CachHelper.SaveUserKey('isLight', isLightMode).then((value) {
      if (isLightMode) {
        modeIcon = Icons.brightness_2_outlined;
      } else {
        modeIcon = Icons.brightness_2_rounded;
      }
      CachHelper.getUserValue(key: 'isLight', userName: cachedValue);
    }).catchError((e) => print(e.toString()));

    emit(NewsAppCubitChangeModeState());
  }

  List<dynamic> Bussiness = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getBussiness() {
    emit(NewsAppGetBussinessLoadingState());
    if (Bussiness.length == 0) {
      DioHelper.getData(
        urlPath,
        bussinessQuery,
      ).then((value) {
        Bussiness = value.data['articles'];
        print(Bussiness[0]['title']);
        emit(NewsAppGetBusssinesSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsAppErrorState(e.toString()));
      });
    } else {
      emit(NewsAppGetBusssinesSuccessState());
    }
  }

  void getSports() {
    emit(NewsAppGetSportsLoadingState());

    if (sports.length == 0) {
      DioHelper.getData(
        urlPath,
        sportsQuery,
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsAppGetSportsSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsAppErrorState(e.toString()));
      });
    } else {
      emit(NewsAppGetSportsSuccessState());
    }
  }

  void getScience() {
    emit(NewsAppGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(
        urlPath,
        scienceQuery,
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsAppGetScienceSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsAppErrorState(e.toString()));
      });
    } else {
      emit(NewsAppGetScienceSuccessState());
    }
  }

  void getSearch(String searchedValue) {
    emit(NewsAppGetSearchLoadingState());
    DioHelper.getData(
      'v2/everything',
      {
        'q': '$searchedValue',
        'apiKey': '1242652b011b46c381aa46cc72f75f6f',
      },
    ).then((value) {
      search = value.data['articles'];
    }).catchError((e) {
      print(e.toString());
      emit(NewsAppErrorState(e));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  launchURL(int index, var link, dynamic context, dynamic state) async {
    emit(NewsAppLuanchingNewPageState());

    print(link[index]["url"]);

    final uri = Uri.parse("${link[index]["url"]}");
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
      );
    } else {
      throw 'error launching $uri';
    }
    emit(NewsAppLuanchingNewPageSuccesState());
  }

  dynamic userName;

  int count = 0;

  // setSharedValue(String key, dynamic val) async {
  //   await CachHelper.SaveUserKey(key, val);
  //   print(val);
  //   emit(LocalizationState());
  // }

  // getSharedValue(String key) async {
  //   userName = CachHelper.getUserValue(key, userName);
  //   print(userName);
  //   emit(LocalizationState());
  // }
}
