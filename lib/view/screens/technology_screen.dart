import 'package:api_test1/view/widgets/technology_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cupit/app_cubit.dart';
import '../../controller/cupit/app_state.dart';

class Technology extends StatefulWidget {
  const Technology({super.key});

  @override
  State<Technology> createState() => _TechnologyState();
}

class _TechnologyState extends State<Technology> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Technology News",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: cubit.technology.length,
              itemBuilder: (context, index) {
                return technology(cubit.technology[index]);
              }
          );
        },
      ),
    );
  }
}
