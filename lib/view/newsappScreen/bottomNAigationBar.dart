import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/controll/newsappcubit/newsappcubit_cubit.dart';
import 'package:flutter_application_1/remote/dioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBotttomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsappcubitCubit, NewsappcubitState>(
      builder: (context, state) {
        ///create object from newsCubit
        var newsCubitObj = NewsappcubitCubit.get(context);
        //////////////////////////////////////////////////////////
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'NewsApp',
              style: Theme.of(context).textTheme.headline1,
            ),
            actions: [
              IconButton(
                onPressed: () => newsCubitObj.changeMode(),
                icon: Icon(newsCubitObj.modeIcon),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: newsCubitObj.currentIndex,
              elevation: 0.0,
              onTap: (index) {
                newsCubitObj.changeIndex(index);
              },
              //********************************************************************** */
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.business,
                  ),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.sports,
                  ),
                  label: 'Sports',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.science,
                  ),
                  label: 'Science',
                ),
              ]),
          //********************************************************************************************** */
          body: newsCubitObj.screens[newsCubitObj.currentIndex],
        );
      },
    );
  }
}
