import 'package:bmi_calculator/utils/vars.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LinearColorGraph extends StatelessWidget {
  double value;
  LinearColorGraph({
    super.key,
    required this.value,
  });

  double convertTo0ToRange(double inputNumber, double range) {
    return (((inputNumber - 13) / (35 - 13)) * range) - offset / 2;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - offset * 1.3;
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              children: [
                Container(
                  width: width / 4,
                  height: 3,
                  decoration: BoxDecoration(
                      color:
                          Color.fromARGB(255, 126, 148, 126).withOpacity(0.6)),
                ),
                Container(
                  width: width / 4,
                  height: 3,
                  decoration:
                      BoxDecoration(color: Colors.green.withOpacity(0.8)),
                ),
                Container(
                  width: width / 4,
                  height: 3,
                  decoration:
                      BoxDecoration(color: Colors.orange.withOpacity(0.4)),
                ),
                Container(
                  width: width / 4,
                  height: 3,
                  decoration: BoxDecoration(color: Colors.red.withOpacity(0.4)),
                ),
              ],
            ),
            Transform.translate(
              offset: Offset(convertTo0ToRange(value, width), 0),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: darkDynamic?.onSecondaryContainer,
                    borderRadius: BorderRadius.all(Radius.circular(60))),
              ),
            )
          ],
        ),
      );
    });
  }
}
