import 'package:api_test1/controller/cupit/app_cubit.dart';
import 'package:api_test1/controller/cupit/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        // if (state is DataLoadingState) {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
        // else if (state is DataSuccessState) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.teal,
              onTap: (val) {
                appCubit.changeIndex(val);
              },
              currentIndex: appCubit.currentIndex,
              selectedItemColor: Colors.purple,
              selectedFontSize: 25,
              unselectedItemColor: Colors.black,
              iconSize: 30,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: 'Business'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.health_and_safety), label: 'Health'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports_baseball_rounded), label: 'Sports'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.computer), label: 'Technology'),
              ],
            ),
            body: appCubit.pages[appCubit.currentIndex],
          );
        // }
        // else if (state is DataFailedState) {
        //   return const Center(
        //     child: Text(
        //       "Error",
        //       style: TextStyle(
        //           fontWeight: FontWeight.bold, fontSize: 40, color: Colors.red),
        //     ),
        //   );
        // } else {
        //   return const SizedBox();
        // }
      },
    );
  }
}
