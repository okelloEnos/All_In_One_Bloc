import 'package:all_in_one/blocs/todos_bloc/todos.dart';
import 'package:all_in_one/model/todo.dart';
import 'package:all_in_one/screens/todos/todo_detail.dart';
import 'package:all_in_one/widget/delete_snackbar.dart';
import 'package:all_in_one/widget/separating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;

  const TodosList({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        Todo todoItem = todos[index];

        return TodoCard(todoItem: todoItem);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Separator();
      },
    );
  }
}

class TodoCard extends StatelessWidget {
  final Todo todoItem;

  const TodoCard({Key? key, required this.todoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction){
        BlocProvider.of<TodosBloc>(context).add(TodosDeleted(todoItem));
        ScaffoldMessenger.of(context).showSnackBar(
            DeleteTodoSnackBar(todo: todoItem, onUndo: () => BlocProvider.of<TodosBloc>(context).add(
                TodosAdded(Todo(
                    title: todoItem.title,
                    description: todoItem.description,
                    isCompleted: todoItem.isCompleted,
                    taskId: ''))
            )));
      },
      child: ListTile(
        onTap: () async {
          final Todo? removedTodo = await Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return TodoDetail(todoItem: todoItem);
          }));

          if (removedTodo != null) {
            ScaffoldMessenger.of(context).showSnackBar(
                DeleteTodoSnackBar(todo: removedTodo,
                    onUndo: () =>  BlocProvider.of<TodosBloc>(context).add(
                    TodosAdded(Todo(
                        title: removedTodo.title,
                        description: removedTodo.description,
                        isCompleted: removedTodo.isCompleted,
                        taskId: ''))
                )));
          }
        },
        title: Text(todoItem.title),
        subtitle: Text(todoItem.description),
        leading: todoItem.isCompleted
            ? const Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.green,
                size: 28,
              )
            : const Icon(
                Icons.close_rounded,
                color: Colors.red,
                size: 28,
              ),
        trailing: Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(Colors.blue),
            side: const BorderSide(color: Colors.blue),
            value: todoItem.isCompleted,
            onChanged: (_) => BlocProvider.of<TodosBloc>(context)
              ..add(TodosUpdated(
                  todoItem.copyWith(isCompleted: !todoItem.isCompleted)))),
      ),
    );
  }
}
