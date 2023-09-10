import 'dart:convert';

import 'package:api_test1/controller/cupit/app_state.dart';
import 'package:api_test1/controller/data/remote/dio_helper.dart';
import 'package:api_test1/controller/data/remote/end_point.dart';
import 'package:api_test1/view/screens/business.dart';
import 'package:api_test1/view/screens/health.dart';
import 'package:api_test1/view/screens/sports_screen.dart';
import 'package:api_test1/view/screens/technology_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/articles_model.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitState());
  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  DioHelper dioHelper = DioHelper();
  List<Articles> business = [];
   getBusinessData() async {
    try {
      emit(DataLoadingState());
      Response response = await dioHelper.getData(endPoint: endPoint, query: {
        "apiKey": "506e0a878e874024a0113e39438a6851",
        "country": "us",
        "category": "business"
      });
      emit(DataSuccessState());
      response.data["articles"].forEach((v) {
        business.add(Articles.fromMap(v));
        // business.add(v);
      });

    } catch (e) {
      //print(e);
      emit(DataFailedState());
    }
  }
  List<Articles> health = [];
  getHealthData() async {
    try {
      emit(DataLoadingState());
      Response response = await dioHelper.getData(endPoint: endPoint, query: {
        "apiKey": "506e0a878e874024a0113e39438a6851",
        "country": "us",
        "category": "health"
      });
      emit(DataSuccessState());
      response.data["articles"].forEach((v) {
        health.add(Articles.fromMap(v));
      });

    } catch (e) {
      //print(e);
      emit(DataFailedState());
    }
  }

  List<Articles> sports = [];
  getSportsData() async {
    try {
      emit(DataLoadingState());
      Response response = await dioHelper.getData(endPoint: endPoint, query: {
        "apiKey": "506e0a878e874024a0113e39438a6851",
        "country": "us",
        "category": "sports"
      });
      emit(DataSuccessState());
      response.data["articles"].forEach((v) {
        sports.add(Articles.fromMap(v));
      });

    } catch (e) {
      print(e);
      emit(DataFailedState());
    }
  }


  List<Articles> technology = [];
  getTechnologyData() async {
    try {
      emit(DataLoadingState());
      Response response = await dioHelper.getData(endPoint: endPoint, query: {
        "apiKey": "506e0a878e874024a0113e39438a6851",
        "country": "us",
        "category": "technology"
      });
      emit(DataSuccessState());
      response.data["articles"].forEach((v) {
        technology.add(Articles.fromMap(v));
      });

    } catch (e) {
      print(e);
      emit(DataFailedState());
    }
  }


  int currentIndex=0;
  void changeIndex(int index){
    currentIndex=index;
    emit(BottomNavBarChangeIndexState());
  }

  List pages=[
    const Business(),
    const Health(),
    const Sports(),
    const Technology()
  ];

}
