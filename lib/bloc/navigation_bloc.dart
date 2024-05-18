import 'package:rxdart/rxdart.dart';

class NavigationBloc {
  factory NavigationBloc() => _instance;

  NavigationBloc._internal();

  static final NavigationBloc _instance = NavigationBloc._internal();

  final BehaviorSubject<List<Object>> _stackSubject = BehaviorSubject.seeded([]);
  Stream<List<Object>> get stackStream => _stackSubject.stream;

  void pushToStack(Object screen) {
    _stackSubject.add([..._stackSubject.value, screen]);
  }
}
