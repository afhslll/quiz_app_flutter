import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/measurement_constant.dart';
import 'package:quiz_app/ui/shared/style/roboto_style.dart';
import 'package:quiz_app/ui/shared/style/ubuntu_style.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';

class BoxTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? validatorText;
  final IconData? prefixIcon;
  final bool obscureText;
  final Function? onPressSuffixIcon;
  final IconData? suffixIcon;
  final Function()? onTap;
  final TextStyle? style;
  final bool enabled;
  final Function(String)? onChanged;
  final int? minLines;
  final int? maxLines;
  final String? hintText;
  final String? initialValue;

  const BoxTextField({
    this.controller,
    this.keyboardType,
    this.labelText,
    this.validatorText,
    this.prefixIcon,
    this.obscureText = false,
    this.onPressSuffixIcon,
    this.suffixIcon,
    this.onTap,
    this.style,
    this.enabled = true,
    this.onChanged,
    this.minLines,
    this.maxLines = 1,
    this.hintText,
    this.initialValue,
  });
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(primaryColor: ThemeColor.grey.withOpacity(0.8)),
      child: Container(
        height: maxLines! * 21.0,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(ConstantMeasurement.smallBorderRadius),
          border: Border.all(width: 1, color: ThemeColor.grey.withOpacity(0.5)),
        ),
        child: TextFormField(
          initialValue: initialValue,
          enabled: enabled,
          onTap: onTap,
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType ?? TextInputType.text,
          minLines: minLines ?? 1,
          maxLines: maxLines ?? 1,
          obscureText: obscureText,
          style: style ?? RobotoStyle.body1.copyWith(color: ThemeColor.black),
          decoration: InputDecoration(
            errorStyle: RobotoStyle.caption2.copyWith(color: ThemeColor.red),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: hintText,
            hintStyle: UbuntuStyle.button2.copyWith(color: ThemeColor.grey),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return validatorText ?? 'Cannot be empty';
            }
            return null;
          },
        ),
      ),
    );
  }
}
