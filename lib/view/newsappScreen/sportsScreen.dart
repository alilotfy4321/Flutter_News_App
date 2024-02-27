// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controll/newsappcubit/newsappcubit_cubit.dart';
import 'package:flutter_application_1/customWidget/buildArticeItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsappcubitCubit, NewsappcubitState>(
      builder: (context, state) {
        ///////////////////////////////////////////////////feilds--------
        var cubit = NewsappcubitCubit.get(context);
        var articleList = NewsappcubitCubit.get(context).sports;

        ///--------------------------------------------------------------------
        if (state is NewsAppErrorState) {
          return Center(child: Text('${state.toString()}'));
        }

        return ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
                  child: buildArticleItem(context, articleList[index]),
                  onTap: () =>
                      cubit.launchURL(index, articleList, context, state),
                ),
            separatorBuilder: (context, index) => Container(
                  height: 1.0,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
            itemCount: articleList.length);
      },
    );
  }
}
