import 'dart:async';

import 'package:bmi_calculator/utils/vars.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlusMinusUnit extends StatefulWidget {
  final String title;
  final String unit;
  final double initialValue;
  final Function(double) updateValue;

  PlusMinusUnit({
    Key? key,
    required this.title,
    required this.unit,
    required this.initialValue,
    required this.updateValue,
  }) : super(key: key);

  @override
  _PlusMinusUnitState createState() => _PlusMinusUnitState();
}

class _PlusMinusUnitState extends State<PlusMinusUnit> {
  late double value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - offset;
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: width / 2,
            height: width / 2,
            decoration: BoxDecoration(
              color: darkDynamic?.secondaryContainer,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: darkDynamic?.onSecondaryContainer,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              value -= 1;
                            });
                            widget.updateValue(value);
                          },
                          onLongPressStart: (details) {
                            timer = Timer.periodic(
                              Duration(milliseconds: 50),
                              (timer) {
                                setState(() {
                                  value -= 1;
                                });
                              },
                            );
                          },
                          onLongPressEnd: (details) {
                            widget.updateValue(value);
                            timer?.cancel();
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: darkDynamic?.onSecondaryContainer,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                color: darkDynamic?.secondaryContainer,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            color: darkDynamic?.onSecondaryContainer,
                            fontWeight: FontWeight.bold,
                            fontSize: 48,
                          ),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              value += 1;
                            });
                            widget.updateValue(value);
                          },
                          onLongPressStart: (details) {
                            timer = Timer.periodic(
                              Duration(milliseconds: 50),
                              (timer) {
                                setState(() {
                                  value += 1;
                                });
                              },
                            );
                          },
                          onLongPressEnd: (details) {
                            widget.updateValue(value);
                            timer?.cancel();
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: darkDynamic?.onSecondaryContainer,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: darkDynamic?.secondaryContainer,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.unit,
                    style: TextStyle(
                      color: darkDynamic?.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
