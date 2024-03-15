// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controll/newsappcubit/newsappcubit_cubit.dart';
import 'package:flutter_application_1/customWidget/buildArticeItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BussinessScreen extends StatelessWidget {
  const BussinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsApptCubit, NewsappcubitState>(
      builder: (context, state) {
        var cubit = NewsApptCubit.get(context);
        var articleList = cubit.Bussiness;
        if (state is NewsAppErrorState) {
          return Center(child: Text('${state.toString()}'));
        }
        if (state is NewsAppGetBussinessLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          );
        }
        return ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                child: buildArticleItem(context, articleList[index]),
                onTap: () =>
                    cubit.launchURL(index, articleList, context, state),
              );
            },
            separatorBuilder: (context, index) => Container(
                  height: 1.0,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
            itemCount: articleList.length);
      },
    );
  }
}
