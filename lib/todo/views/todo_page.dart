import 'package:api_placeholder/todo/cubit/todo_cubit.dart';
import 'package:api_placeholder/todo/cubit/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<TodoCubit>();
      cubit.fetchTodo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cubit Api Call"),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
        if (state is InitTodoState || state is LoadingTodoState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ResponseTodoState) {
          final todos = state.todos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.title),
              );
            },
          );
        } else if (state is ErrorTodoState) {
          return Center(child: Text(state.message));
        }
        return Center(child: Text(state.toString()));
      }),
    );
  }
}
