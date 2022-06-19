import 'package:design1c/data/elements/data_field.dart';
import 'package:design1c/ui/active_element_border.dart';
import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_bloc.dart';

class UIField extends StatefulWidget {
  final DataField data;
  final bool isActive;

  const UIField({
    Key? key,
    required this.data,
    required this.isActive,
  }) : super(key: key);

  @override
  State<UIField> createState() => _UIFieldState();
}

class _UIFieldState extends State<UIField> {
  late DataField _data;

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
          padding: const EdgeInsets.all(4.0),
          height: Dimens.textFieldHeight,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(2.0)),
            border:
                Border.all(color: FormColors.textFieldBorderColor, width: 1),
          ),
          width: _data.width,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.data.hint,
                style: TextStyles.textFieldTextStyle,
              )),
        ),
        if (widget.isActive)
          ActiveElementBorder(
            width: _data.width,
            height: Dimens.textFieldHeight,
            isResizeAvailable: true,
            onResize: onResize,
          )
      ],
    );
  }
}

const double _ballRadius = 5.0;
