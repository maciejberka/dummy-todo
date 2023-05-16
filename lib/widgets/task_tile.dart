import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/cubits/task/task_cubit.dart';
import 'package:todoapp/cubits/task/task_state.dart';
import 'package:todoapp/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, TaskState state) => InkWell(
        onTap: () {
          final bool isDone = state is TaskInitialState ? task.completed : state is TaskDoneState;
          context.read<TaskCubit>().toggleTask(!isDone);
        },
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(task.name),
          leading: IgnorePointer(
            child: Checkbox(
              value: state is TaskInitialState ? task.completed : state is TaskDoneState,
              onChanged: (_) {},
            ),
          ),
        ),
      ),
    );
  }
}
