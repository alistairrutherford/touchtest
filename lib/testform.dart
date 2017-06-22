import 'package:flutter/material.dart';
import 'touchpad.dart';

class TestForm extends StatefulWidget {
  static const String routeName = '/material/slider';

  @override
  _TestForm createState() => new _TestForm();
}

class _TestForm extends State<TestForm> {
  double _valueSlider1 = 0.0;
  double _valueSlider2 = 0.0;

  /**
   * Touch change handler
   */
  void onChanged(Offset offset) {
    double x = offset.dx;
    double y = offset.dy;

    //print('x:$x, y:$y');
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Column(
        children: <Widget>[
          new Expanded(
            flex: 2,
            child: touchControl()
          ),
          new Expanded(
              flex: 1,
              child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    sliderRow1()
                  ]
              ),
          ),
          new Expanded(
            flex: 1,
            child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  sliderRow2()
                ]
            ),
          ),
        ]
      )
    );
  }

  Widget touchControl() {
    return new TouchPad(onChanged: onChanged);
  }

  Widget sliderRow1() {
    return new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Slider(
              value: _valueSlider1,
              min: -3.0,
              max: 3.0,
              thumbOpenAtMin: true,
              onChanged: (double value) {
                setState(() {
                  _valueSlider1 = value;
                });
              }
          ),
          const Text('Slider 1'),
        ]
    );
  }

  Widget sliderRow2() {
    return new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Slider(
              value: _valueSlider2,
              min: -3.0,
              max: 3.0,
              thumbOpenAtMin: true,
              onChanged: (double value) {
                setState(() {
                  _valueSlider2 = value;
                });
              }
          ),
          const Text('Slider 2'),
        ]
    );
  }

}