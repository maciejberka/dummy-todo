import 'package:equatable/equatable.dart';

class TaskState extends Equatable {
  const TaskState();
  @override
  List<Object> get props => [];
}

class TaskInitialState extends TaskState {}

class TaskDoneState extends TaskState {}

class TaskUndoneState extends TaskState {}
