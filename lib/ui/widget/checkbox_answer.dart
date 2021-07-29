import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/measurement_constant.dart';
import 'package:quiz_app/ui/shared/style/ubuntu_style.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';

class CheckboxAnswer extends StatefulWidget {
  final List<String>? answers;
  final Function(List<int>)? onTap;
  final List<int>? selectedIndexes;
  final int? maxSelect;
  const CheckboxAnswer({
    Key? key,
    this.answers,
    this.onTap,
    this.selectedIndexes,
    this.maxSelect,
  }) : super(key: key);

  @override
  _CheckboxAnswerState createState() => _CheckboxAnswerState();
}

class _CheckboxAnswerState extends State<CheckboxAnswer> {
  List<int> selectedIndexes = [];

  @override
  void initState() {
    selectedIndexes = widget.selectedIndexes ?? [];
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
              if (widget.maxSelect != null) {
                if (selectedIndexes.length < widget.maxSelect!.toInt()) {
                  selectAnswer(index);
                }
              } else {
                selectAnswer(index);
              }
              widget.onTap!(selectedIndexes);
            },
            child: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 0.5,
                    color: _isAnswerSelected(index)
                        ? ThemeColor.lightGrey
                        : ThemeColor.grey,
                  ),
                  color: _isAnswerSelected(index)
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
                      color: _isAnswerSelected(index)
                          ? ThemeColor.primary
                          : ThemeColor.lightGrey,
                    ),
                    child: Visibility(
                      visible: _isAnswerSelected(index),
                      child: Center(
                        child:
                            Icon(Icons.done, color: ThemeColor.white, size: 18),
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

  bool _isAnswerSelected(int value) {
    return selectedIndexes.indexWhere((si) => si == value) != -1;
  }

  void selectAnswer(int index) {
    if (!_isAnswerSelected(index)) {
      setState(() {
        selectedIndexes.add(index);
      });
    } else {
      setState(() {
        selectedIndexes.removeWhere((si) => si == index);
      });
    }
  }
}
