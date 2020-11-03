import 'package:flutter/material.dart';

import 'container_manager.dart';
final GlobalKey<ContainerManagerState> containerManagerKey = GlobalKey<ContainerManagerState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String _platformVersion = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      builder: (BuildContext context, Widget child) {
      assert(child is Navigator, 'child must be Navigator, what is wrong?');

      return ContainerManager(
        key: containerManagerKey,
        initNavigator: child as Navigator,
      );
    },
      home: Container(color: Colors.white,),
    );
  }
}
