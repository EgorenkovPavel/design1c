import 'package:flutter/material.dart';

class ResizeMarker extends StatelessWidget {
  final double parentWidth;
  final double parentHeight;
  final void Function(double newWidth) onUpdate;

  const ResizeMarker({
    Key? key,
    required this.parentWidth,
    required this.parentHeight,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: parentHeight / 2 - ballDiameter / 2,
      left: parentWidth - ballDiameter / 2,
      child: ManipulatingBall(
        onDrag: (dx, dy) {
          //var newHeight = height + dy;
          var newWidth = parentWidth + dx;
          onUpdate(newWidth);
        },
      ),
    );
  }
}

const ballDiameter = 20.0;

class ManipulatingBall extends StatefulWidget {
  const ManipulatingBall({Key? key, required this.onDrag}) : super(key: key);

  final Function onDrag;

  @override
  _ManipulatingBallState createState() => _ManipulatingBallState();
}

class _ManipulatingBallState extends State<ManipulatingBall> {
  double initX = 0;
  double initY = 0;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        width: ballDiameter,
        height: ballDiameter,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
