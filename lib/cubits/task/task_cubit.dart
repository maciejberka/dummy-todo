import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/cubits/task/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitialState());

  void toggleTask(bool isDone) {
    isDone ? emit(TaskDoneState()) : emit(TaskUndoneState());
  }
}
