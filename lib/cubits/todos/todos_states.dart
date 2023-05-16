import 'package:equatable/equatable.dart';
import 'package:todoapp/models/task.dart';

abstract class TodosState extends Equatable {
  const TodosState();
  @override
  List<Object> get props => [];
}

class TodosLoadingState extends TodosState {
  const TodosLoadingState();
}

class TodosErrorState extends TodosState {
  const TodosErrorState();
}

class TodosLoadedState extends TodosState {
  const TodosLoadedState(this.tasks);
  final List<Task> tasks;
}
