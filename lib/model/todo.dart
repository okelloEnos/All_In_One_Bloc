import 'package:equatable/equatable.dart';
class Todo extends Equatable{
  final String title;
  final String description;
  final bool isCompleted;
  final String taskId;

 const Todo({required this.title, required this.description, required this.isCompleted, required this.taskId});

  @override
  List<Object?> get props => [title, description, isCompleted, taskId];

  Todo copyWith({String? title, String? description, String? taskId, bool? isCompleted}){
    return Todo(
        title: title ?? this.title,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted,
        taskId: taskId ?? this.taskId);
  }
}