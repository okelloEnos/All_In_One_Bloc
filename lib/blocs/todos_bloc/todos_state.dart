import 'package:all_in_one/model/todo.dart';
import 'package:equatable/equatable.dart';
abstract class TodosState extends Equatable{
  const TodosState();
}

class TodosInitial extends TodosState{

  @override
  List<Object?> get props => [];
}

class TodosLoadSuccess extends TodosState{
final List<Todo> todos;
const TodosLoadSuccess([this.todos = const []]);

@override
  List<Object?> get props => [todos];
}
