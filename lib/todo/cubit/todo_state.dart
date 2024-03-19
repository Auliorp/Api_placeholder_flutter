import 'package:api_placeholder/models/todo_model.dart';

abstract class TodoState {}

class InitTodoState extends TodoState {}

class LoadingTodoState extends TodoState {}

class ErrorTodoState extends TodoState {
  final String message;
  ErrorTodoState(this.message);
}

class ResponseTodoState extends TodoState {
  final List<TodoModel> todos;
  ResponseTodoState(this.todos);
}
