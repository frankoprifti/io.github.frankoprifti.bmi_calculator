import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/types/types.dart';
import 'package:bmi_calculator/utils/vars.dart';
import 'package:bmi_calculator/widgets/linearcolorgraph.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class BMI extends StatelessWidget {
  double bmi;
  String bmiRange;

  BMI({
    super.key,
    required this.bmi,
    required this.bmiRange,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - offset;

    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: double.infinity,
            height: width / 1.8,
            decoration: BoxDecoration(
                color: darkDynamic?.secondaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your BMI is',
                        style: TextStyle(
                            color: darkDynamic?.onSecondaryContainer,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Text(
                        bmiRange.capitalize(),
                        style: TextStyle(
                            color: darkDynamic?.onSurface,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: TextStyle(
                        color: darkDynamic?.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                        fontSize: 48),
                  ),
                  LinearColorGraph(value: bmi)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
