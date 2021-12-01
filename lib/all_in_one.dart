import 'package:all_in_one/blocs/tab_blocs/tab.dart';
import 'package:all_in_one/screens/bottom_navigation/bottom_navigation_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllInOneApp extends StatelessWidget {
  const AllInOneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All in One',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<TabBloc>(create: (BuildContext context) {
        return TabBloc();
      },
      child: const BottomNavigationScreen(),
      ),
    );
  }
}
