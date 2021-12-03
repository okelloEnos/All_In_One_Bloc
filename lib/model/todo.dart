import 'package:equatable/equatable.dart';
class Todo extends Equatable{
  final String title;
  final String description;
  final bool isCompleted;

 const Todo({required this.title, required this.description, required this.isCompleted});

  @override
  List<Object?> get props => [title, description, isCompleted];

}