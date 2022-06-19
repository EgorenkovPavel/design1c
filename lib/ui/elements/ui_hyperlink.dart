import 'package:design1c/ui/active_element_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/elements/data_hyperlink.dart';
import '../../utils/values.dart';
import '../home_bloc.dart';

class UIHyperlink extends StatefulWidget {
  final DataHyperlink data;
  final bool isActive;

  const UIHyperlink({
    Key? key,
    required this.data,
    required this.isActive,
  }) : super(key: key);

  @override
  State<UIHyperlink> createState() => _UIHyperlinkState();
}

class _UIHyperlinkState extends State<UIHyperlink> {
  late DataHyperlink _data;

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
                style: TextStyles.hyperlinkTextStyle,
              )),
        ),
        if (widget.isActive)
          ActiveElementBorder(
            width: _data.width,
            height: Dimens.minRowHeight,
            isResizeAvailable: true,
            onResize: onResize,
          )
      ],
    );
  }
}

const double _ballRadius = 5.0;
