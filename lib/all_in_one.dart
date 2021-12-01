import 'package:all_in_one/blocs/counter_bloc/counter.dart';
import 'package:all_in_one/blocs/tab_blocs/tab.dart';
import 'package:all_in_one/cubit/counter_cubit.dart';
import 'package:all_in_one/screens/bottom_navigation/bottom_navigation_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// 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
class AllInOneApp extends StatelessWidget {
  const AllInOneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All in One',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<TabBloc>(create: (BuildContext context) {
          return TabBloc();
        },
          // child: const BottomNavigationScreen(),
        ),
        BlocProvider(create: (BuildContext context) {
          return CounterCubit();
        },),
        BlocProvider<CounterBloc>(create: (BuildContext context) {
          return CounterBloc();
        },
          // child: const BottomNavigationScreen(),
        ),
      ],
        child: const BottomNavigationScreen(),),
    );
  }
}
