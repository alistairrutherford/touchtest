import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:touchtest/TouchPad.dart';

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
        title: 'Touch Test',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Scaffold(
          appBar: new AppBar(
            title: const Text('Test'),
          ),
          body: new Container(

            decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            child: new Center(
                child: new TouchPad(onChanged: onChanged),
            ),
          ),
        )
    );
  }
}
