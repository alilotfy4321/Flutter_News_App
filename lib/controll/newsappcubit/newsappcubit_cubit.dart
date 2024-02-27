// ignore_for_file: prefer_const_constructors, prefer_is_empty, unused_element, prefer_const_declarations, curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/remote/dioHelper.dart';
import 'package:flutter_application_1/view/formScreens/SignUpScreen.dart';
import 'package:flutter_application_1/view/formScreens/loginScreen.dart';
import 'package:flutter_application_1/view/formScreens/welcomeScreen.dart';
import 'package:flutter_application_1/view/newsappScreen/bussinessScreen.dart';
import 'package:flutter_application_1/view/newsappScreen/scienceScreen.dart';
import 'package:flutter_application_1/view/newsappScreen/sportsScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'newsappcubit_state.dart';

class NewsappcubitCubit extends Cubit<NewsappcubitState> {
  NewsappcubitCubit() : super(NewsAppCubitInitial());
  static NewsappcubitCubit get(context) => BlocProvider.of(context);

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

  changeMode() {
    isLightMode = !isLightMode;
    if (isLightMode) {
      modeIcon = Icons.brightness_2_outlined;
    } else {
      modeIcon = Icons.brightness_2_rounded;
    }
    emit(NewsAppCubitChangeModeState());
  }

  List<dynamic> Bussiness = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  launchURL(int index, var link, dynamic context, dynamic state) async {
    emit(NewsAppLuanchingNewPageState());
    if (state is NewsAppLuanchingNewPageState) {
      build(context);
    }

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
}
