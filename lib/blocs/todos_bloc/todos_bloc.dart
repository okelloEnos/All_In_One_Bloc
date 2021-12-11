import 'package:all_in_one/model/todo.dart';

import './todos.dart';
import 'package:bloc/bloc.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosInitial()) {
    on<TodosLoaded>(_onTodosLoaded);
    on<TodosUpdated>(_onTodosUpdated);
    on<TodosDeleted>(_onTodosDeleted);
    on<TodosAdded>(_onTodosAdded);
  }

  void _onTodosLoaded(TodosLoaded event, Emitter<TodosState> emit) {
    List<Todo> todos = [];
    todos.add(const Todo(
        taskId: '1',
        title: 'Motion Layout',
        description: "Working with Motion Layout in Flutter",
        isCompleted: false));
    todos.add(const Todo(
        taskId: '2',
        title: 'Images & Videos',
        description: "Implementing a screen with Music and Videos Playing",
        isCompleted: false));
    todos.add(const Todo(
        taskId: '3',
        title: 'Multi Modules',
        description: "Multi Module App implementation from flutter",
        isCompleted: false));
    todos.add(const Todo(
        taskId: '4',
        title: 'State management Event',
        description:
            "On first December attend an online live youtube session by flutter community",
        isCompleted: true));

    emit(TodosLoadSuccess(todos));
  }

  void _onTodosUpdated(TodosUpdated event, Emitter<TodosState> emit) {
    if (state is TodosLoadSuccess) {
      final List<Todo> updatedTodos =
          (state as TodosLoadSuccess).todos.map((todo) {
        return todo.taskId == event.todo.taskId ? event.todo : todo;
      }).toList();

      emit(TodosLoadSuccess(updatedTodos));
    }
  }

  void _onTodosDeleted(TodosDeleted event, Emitter<TodosState> emit) {
    if (state is TodosLoadSuccess) {
      final List<Todo> updatedTodos = (state as TodosLoadSuccess)
          .todos
          .where((todo) => todo.taskId != event.todo.taskId)
          .toList();

      emit(TodosLoadSuccess(updatedTodos));
    }
  }

  void _onTodosAdded(TodosAdded event, Emitter<TodosState> emit) {
    if (state is TodosLoadSuccess) {
      final addedTodo = Todo(
          title: event.todo.title,
          description: event.todo.description,
          isCompleted: event.todo.isCompleted,
          taskId: '${(state as TodosLoadSuccess).todos.length + 1}');

      final todos = (state as TodosLoadSuccess).todos.toList();
      todos.add(addedTodo);

      emit(TodosLoadSuccess(todos));
    }
  }
}
