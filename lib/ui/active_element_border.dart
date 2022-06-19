import 'package:flutter/material.dart';

import '../utils/values.dart';

class ActiveElementBorder extends StatelessWidget {
  final double _ballRadius = 5.0;
  final double width;
  final double height;
  final bool horizontalResizeAvailable;
  final bool verticalResizeAvailable;
  final void Function(double dx)? onHorizontalResize;
  final void Function(double dx)? onVerticalResize;

  const ActiveElementBorder({
    Key? key,
    required this.width,
    required this.height,
    required this.horizontalResizeAvailable,
    required this.verticalResizeAvailable,
    this.onHorizontalResize,
    this.onVerticalResize,
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
        if (horizontalResizeAvailable)
          Positioned(
            top: Dimens.minRowHeight / 2 - _ballRadius,
            right: 0 - _ballRadius,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onHorizontalDragUpdate: (details) {
                if (onHorizontalResize != null) {
                  onHorizontalResize!(details.delta.dx);
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
          ),
        if (verticalResizeAvailable)
          Positioned(
            bottom: 0 - _ballRadius,
            right: width / 2,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragUpdate: (details) {
                if (onVerticalResize != null) {
                  onVerticalResize!(details.delta.dy);
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
