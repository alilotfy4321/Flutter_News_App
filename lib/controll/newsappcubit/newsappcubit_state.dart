// ignore_for_file: must_be_immutable

part of 'newsappcubit_cubit.dart';

@immutable
abstract class NewsappcubitState {}

class NewsAppCubitInitial extends NewsappcubitState {}

class NewsAppCubitChangeState extends NewsappcubitState {
  NewsAppCubitChangeState(int index);
}

class NewsAppCubitChangeModeState extends NewsappcubitState {}
//-----------------------bussines----------------------------

class NewsAppGetBussinessLoadingState extends NewsappcubitState {}

class NewsAppGetBusssinesSuccessState extends NewsappcubitState {}

//-----------------------sports--------------------------------

class NewsAppGetSportsLoadingState extends NewsappcubitState {}

class NewsAppGetSportsSuccessState extends NewsappcubitState {}

//--------------------science----------------------------------------
class NewsAppGetScienceLoadingState extends NewsappcubitState {}

class NewsAppGetScienceSuccessState extends NewsappcubitState {}

///////////////////search------------------------------------------
class NewsAppGetSearchLoadingState extends NewsappcubitState {}

class NewsAppGetSearchSuccessState extends NewsappcubitState {}

//----------------launcing---------------------------------------------------

class NewsAppLuanchingNewPageState extends NewsappcubitState {}

class NewsAppLuanchingNewPageSuccesState extends NewsappcubitState {}

//-------------------------------------------------------------------

class NewsAppErrorState extends NewsappcubitState {
  String error;

  NewsAppErrorState(this.error);
}
//---------------sharedPreference----------------------------------

class LocalizationState extends NewsappcubitState {}
