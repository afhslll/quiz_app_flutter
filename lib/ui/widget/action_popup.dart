import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/measurement_constant.dart';
import 'package:quiz_app/ui/shared/style/roboto_style.dart';
import 'package:quiz_app/ui/shared/style/ubuntu_style.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';

void showActionDialog({
  BuildContext? context,
  String? titleText,
  String? descriptionText,
  String? positiveText,
  String? negativeText,
  Function()? onTapPositive,
  Function()? onTapNegative,
}) {
  showDialog(
    useSafeArea: false,
    context: context!,
    builder: (context) => Container(
      margin: MediaQuery.of(context).viewInsets,
      color: ThemeColor.black.withOpacity(0.5),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(ConstantMeasurement.smallBorderRadius),
              ),
              color: ThemeColor.white,
            ),
            child: Material(
              color: ThemeColor.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    titleText ?? '',
                    style:
                        UbuntuStyle.button1.copyWith(color: ThemeColor.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    descriptionText ?? '',
                    style: RobotoStyle.body1.copyWith(color: ThemeColor.black),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: onTapNegative,
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ConstantMeasurement.smallBorderRadius),
                                color: ThemeColor.red,
                              ),
                              child: Center(
                                child: Text(
                                  negativeText ?? 'Cancel',
                                  style: UbuntuStyle.button1
                                      .copyWith(color: ThemeColor.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: onTapPositive,
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ConstantMeasurement.smallBorderRadius),
                                color: ThemeColor.primary,
                              ),
                              child: Center(
                                child: Text(
                                  positiveText ?? 'Yes',
                                  style: UbuntuStyle.button1
                                      .copyWith(color: ThemeColor.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
