import 'package:all_in_one/all_in_one.dart';
import 'package:all_in_one/blocs/todos_bloc/todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context){
        return TodosBloc()..add(TodosLoaded());
      },
    child: const AllInOneApp(),
    )
  );
}
