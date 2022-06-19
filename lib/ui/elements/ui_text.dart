import 'package:design1c/data/elements/data_text.dart';
import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_bloc.dart';

class UIText extends StatefulWidget {
  final DataText data;
  final bool isActive;

  const UIText({
    Key? key,
    required this.data,
    required this.isActive,
  }) : super(key: key);

  @override
  State<UIText> createState() => _UITextState();
}

class _UITextState extends State<UIText> {
  late DataText _data;

  @override
  void initState() {
    super.initState();
    _data = widget.data;
  }

  void updateWidths(BuildContext context, Offset offset) {
    final delta = offset.dx;

    _data = _data.copyWith(width: _data.width + delta);

    setState(() {});

    context.read<HomeBloc>().add(OnElementChanged(_data));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isActive) {
      return Stack(
        children: [
          Container(
            width: _data.width,
            padding: const EdgeInsets.all(4.0),
            height: Dimens.minRowHeight,
            // decoration: BoxDecoration(
            //   borderRadius: const BorderRadius.all(Radius.circular(2.0)),
            //   border: Border.all(color: Colors.black, width: widget.isActive ? 2 : 0),
            // ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _data.text,
                  style: TextStyles.textTextStyle,
                )),
          ),
          Container(
            width: _data.width,
            height: Dimens.minRowHeight,
            decoration: BoxDecoration(
              border: Border.all(
                width: Dimens.activeElementBorderWidth,
                color: FormColors.activeElementBorderColor,
              ),
            ),
          ),
          // ResizeMarker(
          //     parentWidth: widget.data.width,
          //     parentHeight: Dimens.minRowHeigth,
          //     onUpdate: (newWidth) {
          //       if (onUpdate != null) {
          //         onUpdate!(widget.data.copyWith(width: newWidth));
          //       }
          //     })
          Positioned(
            top: Dimens.minRowHeight / 2 - _ballRadius,
            right: 0 - _ballRadius,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onHorizontalDragUpdate: (details) {
                updateWidths(context, details.delta);
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
    } else {
      return Container(
        width: _data.width,
        padding: const EdgeInsets.all(4.0),
        height: Dimens.minRowHeight,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.data.text,
              style: TextStyles.textTextStyle,
            )),
      );
    }
  }
}

const double _ballRadius = 5.0;
