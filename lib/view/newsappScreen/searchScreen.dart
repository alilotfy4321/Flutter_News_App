// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controll/newsappcubit/newsappcubit_cubit.dart';
import 'package:flutter_application_1/customWidget/buildArticeItem.dart';
import 'package:flutter_application_1/customWidget/customTextFormField.dart';
import 'package:flutter_application_1/customWidget/vhSpace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocBuilder<NewsApptCubit, NewsappcubitState>(
      builder: (context, state) {
        //////fields----------------------------------
        var cubit = NewsApptCubit.get(context);
        var articleList = cubit.search;
        //------------------------------------------------
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
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomTextFormField(
                  controller: searchController,
                  label: 'search',
                  hint: 'Enter key of search',
                  icon: Icons.search,
                  isLight: cubit.isLightMode,
                  function: (value) {
                    cubit.getSearch(value);
                  },
                ),
                VSpace(),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: buildArticleItem(context, articleList[index]),
                          onTap: () => cubit.launchURL(
                              index, articleList, context, state),
                        );
                      },
                      separatorBuilder: (context, index) => Container(
                            height: 1.0,
                            decoration: BoxDecoration(color: Colors.grey),
                          ),
                      itemCount: articleList.length),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
