
import 'package:flutter/material.dart';
import 'package:navigator_test_example/second_widget.dart';

import 'container_manager.dart';

class FirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('first'),),
      body: Center(
        child: RaisedButton(
          child: const Text('click'),
          onPressed: () {
            ContainerManagerState state =  context.findAncestorStateOfType<ContainerManagerState>();
          state.pushContainer((context) => SecondWidget());
        })
      ),
    );
  }
}






