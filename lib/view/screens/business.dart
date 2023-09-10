import 'package:api_test1/controller/cupit/app_cubit.dart';
import 'package:api_test1/controller/cupit/app_state.dart';
import 'package:api_test1/view/widgets/business_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business News",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple,
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: cubit.business.length,
              itemBuilder: (context, index) {
                return business(cubit.business[index]);
              });
        },
      ),
    );
  }
}
