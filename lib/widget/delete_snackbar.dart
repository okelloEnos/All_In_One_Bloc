import 'package:all_in_one/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeleteTodoSnackBar extends SnackBar{

  DeleteTodoSnackBar({Key? key, required Todo todo, required VoidCallback onUndo}) : super(key: key,
    content: Text('${todo.title} is Deleted', maxLines: 1, overflow: TextOverflow.ellipsis,),
    duration: const Duration(seconds: 4),
    action: SnackBarAction(label: 'Undo', onPressed: onUndo)
  );
}