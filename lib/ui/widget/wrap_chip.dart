import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/measurement_constant.dart';
import 'package:quiz_app/ui/shared/style/roboto_style.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';

class WrapChip extends StatelessWidget {
  final List<String>? items;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  const WrapChip({
    this.items,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Wrap(
        spacing: 12.0,
        runSpacing: 12.0,
        alignment: WrapAlignment.start,
        children: List.generate(
          items?.length ?? 0,
          (index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: backgroundColor ?? ThemeColor.lightGrey,
              borderRadius: BorderRadius.circular(
                  borderRadius ?? ConstantMeasurement.smallBorderRadius),
            ),
            child: Text(
              items?[index] ?? '',
              style: RobotoStyle.body3.copyWith(
                color: textColor ?? ThemeColor.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
