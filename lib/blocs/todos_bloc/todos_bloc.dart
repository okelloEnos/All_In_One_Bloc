import 'package:all_in_one/model/todo.dart';

import './todos.dart';
import 'package:bloc/bloc.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState>{
 TodosBloc(): super(TodosInitial()){
    on<TodosLoaded>(_onTodosLoaded);
  }

void _onTodosLoaded(TodosLoaded event, Emitter<TodosState> emit){
    List<Todo> todos = [];
    todos.add(const Todo(title: 'Motion Layout', description: "Working with Motion Layout in Flutter", isCompleted: false));
    todos.add(const Todo(title: 'Images & Videos', description: "Implementing a screen with Music and Videos Playing", isCompleted: false));
    todos.add(const Todo(title: 'Multi Modules', description: "Multi Module App implementation from flutter", isCompleted: false));
    todos.add(const Todo(title: 'State management Event', description: "On first December attend an online live youtube session by flutter community", isCompleted: true));

    emit(TodosLoadSuccess(todos));
}

}