
import 'package:flutter/material.dart';

import '../utils/values.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.formTitlePadding),
      child: Row(
        children: [
          Container(
            height: 24,
            width: 36,
            decoration: BoxDecoration(
              border: Border.all(color: FormColors.formTitleIconBorderColor, width: Dimens.formTitleIconBorderWidth),
              borderRadius: BorderRadius.circular(Dimens.formTitleIconBorderRadius),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              height: 24,
              width: 36,
              decoration: BoxDecoration(
                border: Border.all(color: FormColors.formTitleIconBorderColor, width: Dimens.formTitleIconBorderWidth),
                borderRadius: BorderRadius.circular(Dimens.formTitleIconBorderRadius),
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          const Text(
            'Реализация товаров услуг',
            style: TextStyles.formTitleTextStyle,
          ),
          const Spacer(),
          const SizedBox(
            width: 30,
            height: 24,
            child: Icon(Icons.more_vert, color: FormColors.formTitleTextColor, size: 15),
          ),
          const SizedBox(
            width: 30,
            height: 24,
            child: Icon(Icons.close, color: FormColors.formTitleTextColor, size: 15),
          ),

        ],
      ),
    );
  }
}