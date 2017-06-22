import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'testform.dart';

void main() {
  runApp(new TouchTest());
}

/**
 * Main view.
 *
 */
class TouchTest extends StatelessWidget {

  /**
   * Change handler
   */
  void onChanged(Offset offset) {
    double x = offset.dx;
    double y = offset.dy;

    //print('x:$x, y:$y');
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Test Form',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Scaffold(
          appBar: new AppBar(
            title: const Text('Test'),
          ),
          body: new TestForm(),
        )
    );
  }
}

