import 'package:all_in_one/cubit/counter_cubit.dart';
import 'package:all_in_one/screens/counter/counter_bloc_screen.dart';
import 'package:all_in_one/screens/counter/counter_cubit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
//
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        bottom: TabBar(
          tabs: [
            Text(
              'Cubit',
              style: theme.textTheme.headline5!.copyWith(color: Colors.white),
            ),
            Text(
              'Bloc',
              style: theme.textTheme.headline5!.copyWith(color: Colors.white),
            )
          ],
          controller: tabController,
        ),
      ),
      body:  TabBarView(
        children: const [CounterCubitScreen(), CounterBlocScreen()],
        controller: tabController,
        // controller: tabController,
        //  children: [],
      ),
      // body: Center(child: BlocBuilder<CounterCubit, int>(
      //   builder: (BuildContext context, state) {
      //     return Text(
      //       'Counter Value:   $state',
      //       style: theme.textTheme.headline4,
      //     );
      //   },
      // )),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //         child: const Icon(Icons.add),
      //         onPressed: () {
      //           context.read<CounterCubit>().increment();
      //         }),
      //     const SizedBox(
      //       height: 8,
      //     ),
      //     FloatingActionButton(
      //         child: const Icon(Icons.remove),
      //         onPressed: () {
      //           context.read<CounterCubit>().decrement();
      //         })
      //   ],
      // ),
    );
  }
}
