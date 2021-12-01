import 'package:all_in_one/blocs/tab_blocs/tab.dart';
import 'package:all_in_one/screens/counter/counter_screen.dart';
import 'package:all_in_one/screens/music_movies/music_movies_screen.dart';
import 'package:all_in_one/screens/network_calls/network_calls_screen.dart';
import 'package:all_in_one/screens/todos/todos_screen.dart';
import 'package:all_in_one/widget/navigation_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: state == TabState.counter ? const CounterScreen() :
              state == TabState.todos ? const TodosScreen( ):
              state == TabState.networkCalls ? const NetworkCallsScreen() : const MoviesMusicScreen(),
          bottomNavigationBar: NavigationSelector(
              tabState: state,
              onNavItemSelected: (tab) => BlocProvider.of<TabBloc>(context).add(TabUpdated(tab))),
        );
      },);
  }
}
