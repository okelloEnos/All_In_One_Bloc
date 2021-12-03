import 'package:all_in_one/blocs/todos_bloc/todos.dart';
import 'package:all_in_one/model/todo.dart';
import 'package:all_in_one/widget/loading_indicator.dart';
import 'package:all_in_one/widget/todos_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Todos Task'),),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder:(BuildContext context, todoState){
          if(todoState is TodosInitial){
            return loadingIndicator();
          }
          else if(todoState is TodosLoadSuccess){
              List<Todo> todos = todoState.todos;

              return TodosList(todos: todos);
            }
          else {
            return const Center(child: Text('There are No any Task to Perform'));
          }
        }
      ),
    );
  }
}
