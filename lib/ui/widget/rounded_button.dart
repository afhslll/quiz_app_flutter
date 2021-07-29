import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/measurement_constant.dart';
import 'package:quiz_app/ui/shared/style/common_style.dart';
import 'package:quiz_app/ui/shared/style/ubuntu_style.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';

class RoundedButton extends StatelessWidget {
  final String? buttonText;
  final Color buttonColor;
  final Color textColor;
  final Function()? onTap;
  final bool isLoading;
  final bool needShadow;
  final IconData? icon;
  final double padding;
  final bool useSafeArea;

  const RoundedButton({
    this.buttonText,
    this.buttonColor = ThemeColor.primary,
    this.textColor = ThemeColor.white,
    this.onTap,
    this.isLoading = false,
    this.needShadow = true,
    this.icon,
    this.padding = 16,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: useSafeArea,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: isLoading
            ? Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Center(
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator())),
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(padding, 0, padding, padding),
                child: InkWell(
                  onTap: isLoading ? () {} : onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          ConstantMeasurement.smallBorderRadius),
                      boxShadow: needShadow ? [CommonStyle.boxShadow1] : [],
                      color: buttonColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonText ?? '',
                          textAlign: TextAlign.center,
                          style: UbuntuStyle.button1.copyWith(color: textColor),
                        ),
                        Visibility(
                          visible: icon != null,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            child: Icon(
                              icon,
                              color: ThemeColor.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
