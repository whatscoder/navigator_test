


import 'package:flutter/cupertino.dart';
import 'package:navigator_test_example/container_manager.dart';

class Manager {
  static final Manager _instance = Manager();
  static Manager get singleton => _instance;
  final GlobalKey<ContainerManagerState> containerManagerKey = GlobalKey<ContainerManagerState>();

  ContainerManagerState get currentState => containerManagerKey.currentState;

  static TransitionBuilder init() {
    return (BuildContext context, Widget child) {
      assert(child is Navigator, 'child must be Navigator, what is wrong?');

      final ContainerManager manager = ContainerManager(
        key: _instance.containerManagerKey,
        initNavigator: child as Navigator,
      );

      return manager;
    };
  }
}