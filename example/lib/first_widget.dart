
import 'package:flutter/material.dart';
import 'package:navigator_test_example/manager.dart';
import 'package:navigator_test_example/second_widget.dart';

class FirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('first'),),
      body: Center(
        child: RaisedButton(
          child: const Text('click to route to second'),
          onPressed: () {
            Manager.singleton.currentState.pushContainer((context) => SecondWidget());
        })
      ),
    );
  }
}






