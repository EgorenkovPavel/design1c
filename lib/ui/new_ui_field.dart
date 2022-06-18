import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';

class NewUIField extends StatefulWidget {
  const NewUIField({Key? key}) : super(key: key);

  @override
  State<NewUIField> createState() => _NewUIFieldState();
}

class _NewUIFieldState extends State<NewUIField> {

  final double _ballRadius = 5.0;
  double _width = 30;

  void updateWidths(Offset offset) {

    final delta = offset.dx;

    _width += delta;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Dimens.minRowHeigth,
          width: _width,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Text('This is text field'),
        ),
        Positioned(
          top: Dimens.minRowHeigth / 2 - _ballRadius,
          right: 0 - _ballRadius,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragUpdate: (details) {
              updateWidths(details.delta);
            },
            child: Container(
              height: _ballRadius*2,
              width: _ballRadius*2,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ),
        )
      ],
    );
  }
}
