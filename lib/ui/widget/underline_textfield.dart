import 'package:flutter/material.dart';
import 'package:quiz_app/ui/shared/style/roboto_style.dart';
import 'package:quiz_app/ui/shared/style/ubuntu_style.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';

class UnderlineTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? validatorText;
  final IconData? prefixIcon;
  final bool obscureText;
  final Function()? onPressSuffixIcon;
  final IconData? suffixIcon;
  final Function()? onTap;
  final TextStyle? style;
  final bool enabled;
  final Function(String)? onChanged;
  const UnderlineTextField({
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
  });
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: ThemeColor.grey),
      child: TextFormField(
        enabled: enabled,
        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: obscureText,
        style: style ?? RobotoStyle.body1.copyWith(color: ThemeColor.black),
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: ThemeColor.grey)
              : null,
          labelText: labelText?.toUpperCase() ?? '',
          labelStyle: UbuntuStyle.button2.copyWith(color: ThemeColor.grey),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ThemeColor.grey, width: 0.5),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ThemeColor.grey, width: 0.5),
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: onPressSuffixIcon,
                  icon: Icon(suffixIcon, color: ThemeColor.grey))
              : null,
          errorStyle: RobotoStyle.caption2.copyWith(color: ThemeColor.red),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ThemeColor.red, width: 1),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return validatorText ?? 'Cannot be empty';
          }
          return null;
        },
      ),
    );
  }
}
