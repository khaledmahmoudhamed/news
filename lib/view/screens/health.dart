import 'package:api_test1/controller/cupit/app_cubit.dart';
import 'package:api_test1/controller/cupit/app_state.dart';
import 'package:api_test1/view/widgets/health_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Health extends StatefulWidget {
  const Health({super.key});

  @override
  State<Health> createState() => _BusinessState();
}

class _BusinessState extends State<Health> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health News",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: cubit.health.length,
              itemBuilder: (context, index) {
                return health(cubit.health[index]);
              }
          );
        },
      ),
    );
  }
}