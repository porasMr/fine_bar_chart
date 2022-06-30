library fine_bar_chart;

import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class FineBarChart extends StatefulWidget {
  double? barWidth;
  double? barHeight;
  List<Color>? barColors = List.empty(growable: true);
  List<double>? barValue = List.empty(growable: true);
  List<String>? barBottomName = List.empty(growable: true);
  bool? isBottomNameDisable;
  bool? isValueDisable;
  Color? backgroundColors;
  Color? barBackgroundColors;

  TextStyle? textStyle;

  FineBarChart(
      {Key? key,
      required this.barWidth,
      required this.barHeight,
      required this.barColors,
      required this.barValue,
      required this.barBottomName,
      required this.isBottomNameDisable,
      required this.isValueDisable,
      required this.textStyle,
      required this.backgroundColors,
      required this.barBackgroundColors})
      : super(key: key);

  @override
  State<FineBarChart> createState() {
    return _FineBarChart();
  }
}

class _FineBarChart extends State<FineBarChart> {
  double maxValue = 0;
  @override
  void initState() {
    maxValueMethod();
    super.initState();
  }

  maxValueMethod() {
    for (int i = 0; i < widget.barValue!.length; i++) {
      if (widget.barValue![i] > maxValue) {
        maxValue = widget.barValue![i];
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
        color: widget.backgroundColors,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            blurRadius: 16.0, // soften the shadow
            offset: const Offset(
              2.0, // Move to right 10  horizontally
              2.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Row(children: [
        for (int i = 0; i < widget.barValue!.length; i++)
          Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.isValueDisable == true
                      ? Container()
                      : Text(
                          "${widget.barValue![i]}",
                          style: widget.textStyle,
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: widget.barWidth!,
                    height: widget.barHeight!,
                    child: FAProgressBar(
                        maxValue: maxValue,
                        currentValue: widget.barValue![i],
                        animatedDuration: const Duration(milliseconds: 300),
                        verticalDirection: VerticalDirection.up,
                        direction: Axis.vertical,
                        backgroundColor: widget.barBackgroundColors!,
                        progressColor: widget.barColors![i]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  widget.isBottomNameDisable == true
                      ? Container()
                      : Text(
                          "${widget.barBottomName![i]}",
                          style: widget.textStyle,
                        ),
                ],
              ))
      ]),
    );
  }
}
