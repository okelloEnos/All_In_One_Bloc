import 'package:bloc/bloc.dart';

class CounterObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('The Observer has Changed >>> ${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('An error has occurred in counter');
  }

  @override
  void onCreate(BlocBase bloc) {
    print('Counter observer has been created');
  }

//   @override
//   void onEvent(Bloc bloc, Object event) {
// print('An event was initiated for counter');
//   }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('Counter Transition just happenned');
  }

  @override
  void onClose(BlocBase bloc) {
    print('The Counter has been closed');
  }
}
