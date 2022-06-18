import 'dart:math';

import 'package:flutter/material.dart';

class SizeableWindow extends StatefulWidget {
  const SizeableWindow({Key? key}) : super(key: key);

  @override
  State<SizeableWindow> createState() => _SizeableWindowState();
}

class _SizeableWindowState extends State<SizeableWindow> {
  late double rightBoxPercentage = 0.5;
  late double leftBoxPercentage = 0.5;
  final mimimumSizePerBox = 0.15;
  final dragHandleSize = 14.0;

  void updateWidths(Offset offset) {
    final width = 200;
    final delta = offset.dx;
    if (delta.isNegative) {
      leftBoxPercentage = max(mimimumSizePerBox, ((leftBoxPercentage * width) - delta.abs()) / width);
      rightBoxPercentage = 1 - leftBoxPercentage;
    } else {
      rightBoxPercentage = max(mimimumSizePerBox, ((rightBoxPercentage * width) - delta.abs()) / width);
      leftBoxPercentage = 1 - rightBoxPercentage;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // in case the window size has changed
    // calling this here will make the widget build whenever the window size chagnes
    final width = 200.0;
    final height = 50.0;

    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: width * leftBoxPercentage,
              height: height,
              child: Container(color: Colors.blueGrey),
            ),
            SizedBox(
              width: width * rightBoxPercentage,
              height: height,
              child: Container(color: Colors.brown),
            ),
          ],
        ),
        // keep at the bottom so it's shown above all widgets within the stack
        Positioned(
          left: (width * leftBoxPercentage) - (dragHandleSize / 2.0),
          top: (height * 0.5),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragUpdate: (details) {
              updateWidths(details.delta);
            },
            child: Container(
              height: dragHandleSize,
              width: dragHandleSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ),
        ),
        Positioned(
          left: (width * leftBoxPercentage) - (60 / 2.0),
          top: (height * 0.5) - 25,
          child: const SizedBox(
            height: 20,
            width: 60,
            child: Center(
              child: Text(
                'Drag Me',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}