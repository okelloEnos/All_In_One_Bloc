import 'package:all_in_one/blocs/tab_blocs/tab_event.dart';
import 'package:all_in_one/blocs/tab_blocs/tab_state.dart';
import 'package:bloc/bloc.dart';

class TabBloc extends Bloc<TabEvent, TabState>{
  TabBloc() : super(TabState.counter){
    on<TabUpdated>((event, emit) => emit(event.tab));
  }
}
