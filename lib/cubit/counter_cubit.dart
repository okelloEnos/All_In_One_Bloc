import 'package:bloc/bloc.dart';
class CounterCubit extends Cubit<int>{

  CounterCubit() : super(0);

  /// increase the current state counter by 1
  void increment(){
    emit(state + 1);
  }

  /// decrease the current state counter by 1
  void decrement(){
    emit(state - 1);
  }
}
