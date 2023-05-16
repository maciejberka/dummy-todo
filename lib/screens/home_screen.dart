import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/cubits/task/task_cubit.dart';
import 'package:todoapp/cubits/todos/todos_cubit.dart';
import 'package:todoapp/cubits/todos/todos_states.dart';
import 'package:todoapp/widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TodosCubit>().fetchData();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My TODOS',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: BlocBuilder<TodosCubit, TodosState>(
            builder: (BuildContext context, TodosState state) {
              if (state is TodosLoadingState) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (state is TodosErrorState) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text("Something went wrong. Try again later."),
                  ),
                );
              }

              if (state is TodosLoadedState) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) => BlocProvider(
                    create: (context) => TaskCubit(),
                    child: TaskTile(
                      key: ValueKey(state.tasks[index].id),
                      task: state.tasks[index],
                    ),
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
