import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/measurement_constant.dart';
import 'package:quiz_app/ui/shared/style/ubuntu_style.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';

class RadioAnswer extends StatefulWidget {
  final List<String>? answers;
  final Function(int)? onTap;
  final int? selectedIndex;
  const RadioAnswer({Key? key, this.answers, this.onTap, this.selectedIndex})
      : super(key: key);

  @override
  _RadioAnswerState createState() => _RadioAnswerState();
}

class _RadioAnswerState extends State<RadioAnswer> {
  int? selectedIndex;

  @override
  void initState() {
    if (widget.selectedIndex != null) {
      selectedIndex = widget.selectedIndex;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        widget.answers!.length,
        (index) => Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTap!(index);
            },
            child: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 0.5,
                    color: index == selectedIndex
                        ? ThemeColor.lightGrey
                        : ThemeColor.grey,
                  ),
                  color: index == selectedIndex
                      ? ThemeColor.lightGrey
                      : ThemeColor.white),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          ConstantMeasurement.smallBorderRadius),
                      color: index == selectedIndex
                          ? ThemeColor.primary
                          : ThemeColor.lightGrey,
                    ),
                    child: Center(
                      child: Text(
                        index == 0
                            ? 'A'
                            : index == 1
                                ? 'B'
                                : index == 2
                                    ? 'C'
                                    : 'D',
                        style: UbuntuStyle.button2.copyWith(
                            color: index == selectedIndex
                                ? ThemeColor.white
                                : ThemeColor.black),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(widget.answers![index],
                          style: UbuntuStyle.button2.copyWith(height: 1.3))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
