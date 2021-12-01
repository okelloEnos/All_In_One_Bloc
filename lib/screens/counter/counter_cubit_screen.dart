import 'package:all_in_one/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitScreen extends StatelessWidget {
  const CounterCubitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(child: BlocBuilder<CounterCubit, int>(
        builder: (BuildContext context, state) {
          return Text(
            'Cubit Counter :   $state',
            style: theme.textTheme.headline4,
          );
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                context.read<CounterCubit>().increment();
              }),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                context.read<CounterCubit>().decrement();
              })
        ],
      ),
    );
  }
}
