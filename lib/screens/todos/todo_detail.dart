import 'package:all_in_one/blocs/tab_blocs/tab.dart';
import 'package:all_in_one/blocs/tab_blocs/tab_bloc.dart';
import 'package:all_in_one/blocs/todos_bloc/todos.dart';
import 'package:all_in_one/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoDetail extends StatelessWidget {
  final Todo? todoItem;

   const TodoDetail({Key? key, required this.todoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: todoItem == null ? '' : todoItem!.title);
    final descriptionController = TextEditingController(text: todoItem == null ? '' : todoItem!.description);

   return BlocBuilder<TodosBloc, TodosState>(
     builder: (BuildContext context, state){
       return Scaffold(
         appBar: AppBar(
           title: Text(todoItem == null ? 'Add New Task' : 'Task Detail'),
           actions: [
             todoItem == null ? Container() : IconButton(
                 onPressed: () {
                   BlocProvider.of<TodosBloc>(context).add(TodosDeleted(todoItem!));
                   Navigator.pop(context, todoItem);
                 },
                 icon: const Icon(Icons.delete))
           ],
         ),
         body: Padding(
           padding: const EdgeInsets.all(8.0),
           child: SingleChildScrollView(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisSize: MainAxisSize.min,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child:  todoItem == null ? Container() : Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const Text('Status : '),
                           Text(todoItem!.isCompleted
                               ? 'Task Completed'
                               : 'Task Pending')
                         ],
                       ),

                       Switch(
                           value: todoItem!.isCompleted,
                           onChanged: (_) => BlocProvider.of<TodosBloc>(context)
                             ..add(TodosUpdated(todoItem!.copyWith(
                                 isCompleted: !todoItem!.isCompleted))))
                     ],
                   ),
                 ),
                 const SizedBox(
                   height: 15,
                 ),
                 const Text(
                   'Title',
                   style: TextStyle(fontSize: 22),
                 ),
                 TextFormField(
                   // initialValue: todoItem.title,
                   controller: titleController,
                   decoration: const InputDecoration(
                     hintText: 'Enter Task Title'
                   ),
                   // style: const TextStyle(color: Colors.grey),
                 ),
                 const SizedBox(
                   height: 30,
                 ),
                 const Text(
                   'Description',
                   style: TextStyle(fontSize: 22),
                 ),
                 TextFormField(
                   // initialValue: todoItem.description,
                   maxLines: 5,
                   decoration: const InputDecoration(
                     hintText: 'Enter Task Description'
                   ),
                   controller: descriptionController,
                 ),
                 const SizedBox(
                   height: 50,
                 ),
                 Center(
                     child: ElevatedButton(
                         onPressed: () {
                          if(todoItem != null){
                            print("Items edited are ${titleController.text} || ${descriptionController.text}}");
                            BlocProvider.of<TodosBloc>(context).add(TodosUpdated(
                                todoItem!.copyWith(
                                    title: titleController.text,
                                    description: descriptionController.text)));
                          }
                          else {
                            print("Items added are ${titleController.text} || ${descriptionController.text}}");
                            BlocProvider.of<TodosBloc>(context).add(
                                TodosAdded(Todo(
                                    title: titleController.text,
                                    description: descriptionController.text,
                                    isCompleted: false,
                                    taskId: ''))
                            );
                          }
                          Navigator.pop(context);
                         },
                         child: Text(todoItem == null ? 'Create Task' : 'Update Task'))),
               ],
             ),
           ),
         ),
       );
     },
   );
  }
}
