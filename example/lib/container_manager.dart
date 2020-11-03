
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:navigator_test_example/first_widget.dart';

class ContainerManager extends StatefulWidget {

  const ContainerManager({
    Key key,
    this.initNavigator,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ContainerManagerState();

  final Navigator initNavigator;
}

class ContainerManagerState extends State<ContainerManager> {
  final GlobalKey<OverlayState> _overlayKey = GlobalKey<OverlayState>();
  final List<Navigator> _offstage = <Navigator>[];
  List<OverlayEntry> _leastEntries;
  Navigator _onstage;

  @override
  void initState() {
    super.initState();

    _onstage = Navigator(
      key: GlobalKey<NavigatorState>(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return FirstWidget();
        });
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
        _refreshOverlayEntries();
      });
    } else {
      _refreshOverlayEntries();
    }

    fn();
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(
      key: _overlayKey,
      initialEntries: const <OverlayEntry>[],
    );
  }

  void pushContainer(WidgetBuilder builder) {
    _offstage.add(_onstage);

    _onstage = Navigator(
      key: GlobalKey<NavigatorState>(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute(builder: builder);
      },
    );

    setState(() {
      
    });
  }

  void _refreshOverlayEntries() {
    final OverlayState overlayState = _overlayKey.currentState;

    if (overlayState == null) return;

    if (_leastEntries != null && _leastEntries.isNotEmpty) {
      for (final OverlayEntry entry in _leastEntries) {
        entry.remove();
      }
    }

    final List<Navigator> containers = <Navigator>[];
    containers.addAll(_offstage);
    containers.add(_onstage);

    _leastEntries = containers
        .map<OverlayEntry>(
            (Navigator container) => OverlayEntry(builder: (BuildContext context) => container))
        .toList(growable: false);

    overlayState.insertAll(_leastEntries);
  }
}