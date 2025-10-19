import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/text_styles.dart';
import 'package:fruits_dashboard/core/widgets/custom_check_box.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - (16 * 2) - 48,
          child: Text('Is Featured Product', style: TextStyles.semiBold13),
        ),
        SizedBox(width: 16),

        CustomCheckBox(
          onChanged: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
      ],
    );
  }
}
