import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_text_styles.dart';

// ignore: must_be_immutable
class CustomDropDownButton extends StatefulWidget {
  final List<String> items;
  String? selectedItem;

  final Function onChanged;

  CustomDropDownButton({Key? key, required this.items, this.selectedItem, required this.onChanged}) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Category', style: AppTextStyles.textFormLabel),
          ],
        ),
        icon: SvgPicture.asset(
          AppIcons.svgArrowDown,
          width: 20,
          color: AppColors.white38,
        ),
        value: widget.selectedItem,
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: AppTextStyles.textFormLabel,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        onChanged: widget.onChanged(),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.white38,
            width: 2,
          ),
        ),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.baseColor200,
        ),
        buttonHeight: 60,
        buttonWidth: 160,
        buttonPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        dropdownPadding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        scrollbarAlwaysShow: true,
        dropdownMaxHeight: 150,
      ),
    );
  }
}
