import 'package:all_in_one/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoDetail extends StatelessWidget {
  final Todo todoItem;

  const TodoDetail({Key? key, required this.todoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Text('Status : '), Text(todoItem.isCompleted ? 'Task Completed' : 'Task Pending')],
              ),
              const SizedBox(height: 15,),
              const Text(
                'Title',
                style: TextStyle(fontSize: 22),
              ),
              TextFormField(
                initialValue: todoItem.title,
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
                initialValue: todoItem.description,
                maxLines: 5,
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(child:  ElevatedButton(onPressed: null, child: Text('Save Task'))),
            ],
          ),
        ),
      ),
    );
  }
}
