
import 'package:flutter/material.dart';
import 'package:navigator_test_example/third_widget.dart';

import 'manager.dart';

class SecondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('second'),),
      body: Center(
        child: RaisedButton(
          child: Text('click to route ro third'),
          onPressed: () {
          Manager.singleton.currentState.pushContainer((context) => ThirdWidget());
        },)
      ),
    );
  }
}







