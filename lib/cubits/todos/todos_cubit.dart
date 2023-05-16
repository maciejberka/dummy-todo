import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/cubits/todos/todos_states.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/services/todos_service.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(const TodosLoadingState());

  void fetchData() async {
    try {
      final List<Task> listOfTasks = await TodoService.fetchTodos();
      emit(TodosLoadedState(listOfTasks));
    } catch (e) {
      emit(const TodosErrorState());
    }
  }
}
