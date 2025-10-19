import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/text_styles.dart';
import 'package:fruits_dashboard/core/widgets/custom_check_box.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - (16 * 2) - 48,
          child: Text('Is Organic Product', style: TextStyles.semiBold13),
        ),
        SizedBox(width: 16),

        CustomCheckBox(
          onChanged: (value) {
            isOrganic = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isOrganic,
        ),
      ],
    );
  }
}
