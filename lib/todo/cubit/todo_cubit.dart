import 'package:api_placeholder/repository/todo_repository.dart';
import 'package:api_placeholder/todo/cubit/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _repository;
  TodoCubit(this._repository) : super(InitTodoState());

  Future<void> fetchTodo() async {
    emit(LoadingTodoState());
    try {
      final Response = await _repository.getAll();
      emit(ResponseTodoState(Response));
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
    }
  }
}
