import 'package:flutter/material.dart';

import '../utils/values.dart';

class ActiveElementBorder extends StatelessWidget {
  final double _ballRadius = 5.0;
  final double width;
  final double height;
  final bool isResizeAvailable;
  final void Function(double dx)? onResize;

  const ActiveElementBorder({
    Key? key,
    required this.width,
    required this.height,
    required this.isResizeAvailable,
    this.onResize = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(
              width: Dimens.activeElementBorderWidth,
              color: FormColors.activeElementBorderColor,
            ),
          ),
        ),
        if (isResizeAvailable)
          Positioned(
            top: Dimens.minRowHeight / 2 - _ballRadius,
            right: 0 - _ballRadius,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onHorizontalDragUpdate: (details) {
                if (onResize != null) {
                  onResize!(details.delta.dx);
                }
              },
              child: Container(
                height: _ballRadius * 2,
                width: _ballRadius * 2,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: FormColors.activeElementBorderColor,
                ),
              ),
            ),
          )
      ],
    );
  }
}
