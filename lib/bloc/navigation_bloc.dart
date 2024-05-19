import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class NavigationBloc {
  factory NavigationBloc() => _instance;

  NavigationBloc._internal();

  static final NavigationBloc _instance = NavigationBloc._internal();

  final List<GlobalKey<NavigatorState>> tabNavigatorKeys = List.generate(3, (_) => GlobalKey());

  final BehaviorSubject<int> _currentTabSubject = BehaviorSubject.seeded(0);
  final BehaviorSubject<Map<int, List<Route>>> _tabStacksSubject = BehaviorSubject.seeded({});

  Stream<int> get currentTabStream => _currentTabSubject.stream;
  Stream<Map<int, List<Route>>> get tabStacksStream => _tabStacksSubject.stream;

  int get currentTab => _currentTabSubject.value;
  Map<int, List<Route>> get currentStacks => Map.of(_tabStacksSubject.value);

  void setCurrentTab(int index) {
    _currentTabSubject.add(index);
  }

  void pushToStack(Route route, [int? tab]) {
    tab ??= currentTab;
    final stacks = currentStacks..[tab] ??= [];
    stacks[tab] = [...stacks[tab]!, route];
    _tabStacksSubject.add(stacks);
    tabNavigatorKeys[tab].currentState!.push(route);
  }

  void popFromStack([int? tab]) {
    tab ??= currentTab;
    final stacks = currentStacks..[tab]!.removeLast();
    _tabStacksSubject.add(stacks);
    tabNavigatorKeys[tab].currentState!.pop();
  }

  void clearStack([int? tab]) {
    tab ??= currentTab;
    final stacks = currentStacks..[tab] = [];
    _tabStacksSubject.add(stacks);
    tabNavigatorKeys[tab].currentState!.popUntil((route) => route.isFirst);
  }
}
