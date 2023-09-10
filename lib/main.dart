import 'package:api_test1/controller/cupit/app_cubit.dart';
import 'package:api_test1/controller/data/remote/dio_helper.dart';
import 'package:api_test1/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());

  // List list=[];
  // Map<String,dynamic> map={"status":"ok","articles":[{"author":"khaled","title": "Stocks slide as worries about inflation revive: Stock market news today - Yahoo Finance",},
  // {"author": "Mike Cherry",
  //   "title": "California DMV allows 1.5 million people to get a mobile driver’s license. Where it can be used - KCRA Sacramento",}]};
  // // map.forEach((key, value) {
  // //   list.add(value);
  // //
  // // });
  // map['articles'].forEach((e){
  //   list.add(e);
  // });
  // print(list);
  // print("##############################");
  // print("################################");
  // print("#################################");
  // print(map['articles']);
  // print("################################");
  // print("#################################");
  // print("#################################");
  // print(map);
  // print("################################");
  // print("#################################");
  // print("#################################");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getHealthData()
        ..getBusinessData()
        ..getSportsData()
        ..getTechnologyData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
