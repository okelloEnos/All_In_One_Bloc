import 'package:all_in_one/model/todo.dart';
import 'package:equatable/equatable.dart';
abstract class TodosEvent extends Equatable{
  const TodosEvent();
}

class TodosLoaded extends TodosEvent{
  
  @override
  List<Object?> get props => [];
}

class TodosUpdated extends TodosEvent{
  final Todo todo;

  const TodosUpdated(this.todo);

  @override
  List<Object?> get props => [todo];
}

class TodosDeleted extends TodosEvent{
  final Todo todo;

  const TodosDeleted(this.todo);

  @override
  List<Object?> get props => [todo];
}

class TodosAdded extends TodosEvent{
  final Todo todo;

  const TodosAdded(this.todo);

  @override
  List<Object?> get props => [todo];
}