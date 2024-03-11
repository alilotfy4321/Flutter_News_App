// ignore_for_file: must_be_immutable

part of 'newsappcubit_cubit.dart';

@immutable
abstract class NewsappcubitState {}

class NewsAppCubitInitial extends NewsappcubitState {}

class NewsAppCubitChangeState extends NewsappcubitState {
  NewsAppCubitChangeState(int index);
}

class NewsAppCubitChangeModeState extends NewsappcubitState {}

class NewsAppGetBussinessLoadingState extends NewsappcubitState {}

class NewsAppGetSportsLoadingState extends NewsappcubitState {}

class NewsAppLuanchingNewPageState extends NewsappcubitState {}

class NewsAppLuanchingNewPageSuccesState extends NewsappcubitState {}

class NewsAppGetScienceLoadingState extends NewsappcubitState {}

class NewsAppGetBusssinesSuccessState extends NewsappcubitState {}

class NewsAppGetSportsSuccessState extends NewsappcubitState {}

class NewsAppGetScienceSuccessState extends NewsappcubitState {}

class NewsAppErrorState extends NewsappcubitState {
  String error;

  NewsAppErrorState(this.error);
}

class LocalizationState extends NewsappcubitState {}
