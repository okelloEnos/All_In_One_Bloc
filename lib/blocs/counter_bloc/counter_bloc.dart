import 'package:all_in_one/blocs/counter_bloc/counter_event.dart';
import 'package:bloc/bloc.dart';
class CounterBloc extends Bloc<CounterEvent, int>{
  CounterBloc() : super(0){
    on<IncrementEvent>((event, emit) => emit(state + 1));
    on<DecrementEvent>((event, emit) => state - 1);
  }

}