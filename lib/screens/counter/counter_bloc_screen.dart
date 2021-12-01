import 'package:all_in_one/blocs/counter_bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocScreen extends StatelessWidget {
  const CounterBlocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(child: BlocBuilder<CounterBloc, int>(
        builder: (BuildContext context, state) {
          return Text(
            'Bloc Counter :   $state',
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
                BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
              }),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
              })
        ],
      ),
    );

  }
}
