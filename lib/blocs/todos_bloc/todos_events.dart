import 'package:equatable/equatable.dart';
abstract class TodosEvent extends Equatable{
  const TodosEvent();
}

class TodosLoaded extends TodosEvent{
  
  @override
  List<Object?> get props => [];
}