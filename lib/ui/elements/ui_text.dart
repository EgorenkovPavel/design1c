import 'package:design1c/data/elements/data_text.dart';
import 'package:design1c/ui/active_element_border.dart';
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

  void onResize(double delta){
    _data = _data.copyWith(width: _data.width + delta);

    setState(() {});

    context.read<HomeBloc>().add(OnElementChanged(_data));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: _data.width,
          padding: const EdgeInsets.all(4.0),
          height: Dimens.minRowHeight,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _data.text,
                style: TextStyles.textTextStyle,
              )),
        ),
        if (widget.isActive)
          ActiveElementBorder(
            width: _data.width,
            height: Dimens.minRowHeight,
            horizontalResizeAvailable: true,
            onHorizontalResize: onResize,
            verticalResizeAvailable: false,
          )
      ],
    );
  }
}

const double _ballRadius = 5.0;
