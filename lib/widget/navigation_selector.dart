import 'package:all_in_one/blocs/tab_blocs/tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationSelector extends StatelessWidget {
  final TabState tabState;
  final Function(TabState) onNavItemSelected;

  const NavigationSelector(
      {Key? key, required this.tabState, required this.onNavItemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: TabState.values.indexOf(tabState),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(color: Colors.orange),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (index) => onNavItemSelected(TabState.values[index]),
        items: TabState.values.map((navItem) {
          return BottomNavigationBarItem(
              icon: navItem == TabState.counter
                  ? const Icon(CupertinoIcons.tropicalstorm)
                  : navItem == TabState.todos
                      ? const Icon(CupertinoIcons.square_stack_3d_down_right)
                      : navItem == TabState.networkCalls
                          ? const Icon(CupertinoIcons.chart_bar_circle)
                          : const Icon(CupertinoIcons.music_albums),
              label: navItem== TabState.counter
                  ? 'Counter'
                  : navItem == TabState.todos
                      ? 'Todos'
                      : navItem == TabState.networkCalls
                          ? 'Network Calls'
                          : 'Music & Videos');
        }).toList());
  }
}
