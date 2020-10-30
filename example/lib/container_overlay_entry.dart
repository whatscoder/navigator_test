
import 'package:flutter/material.dart';

class ContainerOverlayEntry extends OverlayEntry {
  ContainerOverlayEntry(Navigator container) : super(builder: (context) => container, opaque: true, maintainState: true);

  bool _removed = false;

  @override
  void remove() {
    assert(!_removed);
    if (_removed) {
      return;
    }
    _removed = true;
    super.remove();
  }
}


