import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class NavigationBloc {
  factory NavigationBloc() => _instance;

  NavigationBloc._internal();

  static final NavigationBloc _instance = NavigationBloc._internal();

  final BehaviorSubject<List<Route>> _stackSubject = BehaviorSubject.seeded([]);
  Stream<List<Object>> get stackStream => _stackSubject.stream;

  void pushToStack(Route route) {
    _stackSubject.add([..._stackSubject.value, route]);
  }

  void popFromStack() {
    final updatedStack = List<Route>.from(_stackSubject.value)..removeLast();
    _stackSubject.add(updatedStack);
  }
}
