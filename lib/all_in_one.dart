import 'package:all_in_one/blocs/counter_bloc/counter.dart';
import 'package:all_in_one/blocs/network_calls_bloc/network_call_bloc.dart';
import 'package:all_in_one/blocs/network_calls_bloc/network_call_event.dart';
import 'package:all_in_one/blocs/tab_blocs/tab.dart';
import 'package:all_in_one/blocs/todos_bloc/todos.dart';
import 'package:all_in_one/cubit/counter_cubit.dart';
import 'package:all_in_one/screens/bottom_navigation/bottom_navigation_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AllInOneApp extends StatelessWidget {
  const AllInOneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All in One',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // checkboxTheme: const CheckboxThemeData(
        //   fillColor: MaterialStateProperty<Color>()
        // )
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<TabBloc>(create: (BuildContext context) {
          return TabBloc();
        },
        ),
        BlocProvider(create: (BuildContext context) {
          return CounterCubit();
        },),
        BlocProvider<CounterBloc>(create: (BuildContext context) {
          return CounterBloc();
        },
        ),
        BlocProvider<PostBloc>(
          create: (BuildContext context){
            return PostBloc(httpClient: http.Client())..add(PostFetched());
          },
        ),
      ],
        child: const BottomNavigationScreen(),),
    );
  }
}
