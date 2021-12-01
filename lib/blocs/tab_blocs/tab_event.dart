import 'package:all_in_one/blocs/tab_blocs/tab_state.dart';
import 'package:equatable/equatable.dart';
abstract class TabEvent extends Equatable{
  const TabEvent();
}

class TabUpdated extends TabEvent{
  final TabState tab;

  const TabUpdated(this.tab);

  @override
  List<Object?> get props => [tab];

  @override
  String toString() {

    return 'TabUpdated { tab: $tab }';
  }
}

