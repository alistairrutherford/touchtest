import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(new TouchTest());
}

class TouchTest extends StatelessWidget {

  /**
   * Change handler
   */
  void onChanged(Offset offset) {
    double x = offset.dx;
    double y = offset.dy;

    print('x:$x, y:$y');
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
                child: new TouchControl(onChanged: onChanged),
            ),
          ),
        )
    );
  }
}

/**
 * Steteful widget
 */
class TouchControl extends StatefulWidget {

  final ValueChanged<Offset> onChanged;

  const TouchControl({Key key, this.onChanged}) : super(key: key);

  @override
  TouchControlState createState() => new TouchControlState();
}

/**
 * Draws a circle at supplied position.
 *
 */
class TouchControlState extends State<TouchControl> {
  double xPos = 0.0;
  double yPos = 0.0;

  void onChanged(Offset offset) {
    final RenderBox referenceBox = context.findRenderObject();
    Offset position = referenceBox.globalToLocal(offset);
    if (widget.onChanged != null)
      widget.onChanged(position);

    setState(() {
      xPos = position.dx - referenceBox.size.width/2;
      yPos = position.dy - referenceBox.size.height/2;
    });
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    if (event is PointerDownEvent ) {
      // ??
    }
  }

  void _handlePanStart(DragStartDetails details) {
    onChanged(details.globalPosition);
  }

  void _handlePanEnd(DragEndDetails details) {
    print('end');
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    onChanged(details.globalPosition);
  }

  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
      constraints: new BoxConstraints.expand(),
      child: new GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart:_handlePanStart,
        onPanEnd: _handlePanEnd,
        onPanUpdate: _handlePanUpdate,
        child: new CustomPaint(
          painter: new GridPainter(),
          child: new Center(
            child:new CustomPaint(
              painter: new TouchControlPainter(xPos, yPos),
            ),
          ),
        ),
      ),
    );
  }
}

/**
 * Painter.
 *
 */
class TouchControlPainter extends CustomPainter {
  static const markerRadius = 10.0;

  Offset position;

  TouchControlPainter(final double x, final double y) {
    this.position = new Offset(x, y);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;

    canvas.drawCircle(new Offset(position.dx, position.dy), markerRadius, paint);
  }


  @override
  bool shouldRepaint(TouchControlPainter old) => position.dx != old.position.dx && position.dy !=old.position.dy;
}

/**
 * Grid Painter.
 *
 */
class GridPainter extends CustomPainter {

  Offset position;

  GridPainter() {
    this.position = new Offset(0.0, 0.0);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;

    Offset centreLeft = size.centerLeft(position);
    Offset centreRight = size.centerRight(position);

    canvas.drawLine(centreLeft, centreRight, paint);

    Offset topCentre = size.topCenter(position);
    Offset bottomCentre = size.bottomCenter(position);

    canvas.drawLine(topCentre, bottomCentre, paint);
  }


  @override
  bool shouldRepaint(GridPainter old) => position.dx != old.position.dx && position.dy !=old.position.dy;
}