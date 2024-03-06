import 'package:bmi_calculator/types/types.dart';
import 'package:bmi_calculator/utils/vars.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class Height extends StatelessWidget {
  double height;
  dynamic updateHeight;
  dynamic updateUnit;
  HeightE unit;
  Height({
    super.key,
    required this.height,
    required this.updateHeight,
    required this.updateUnit,
    required this.unit,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                            color: darkDynamic?.onSecondaryContainer,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              updateUnit(HeightE.inches);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: darkDynamic?.onSecondaryContainer
                                      .withOpacity(
                                          unit == HeightE.inches ? 1 : 0.3),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(60))),
                              child: Center(
                                  child: Text(
                                'In',
                                style: TextStyle(
                                    color: unit == HeightE.inches
                                        ? darkDynamic?.primaryContainer
                                        : darkDynamic?.onPrimaryContainer),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              updateUnit(HeightE.foot);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: darkDynamic?.onSecondaryContainer
                                      .withOpacity(
                                          unit == HeightE.foot ? 1 : 0.3),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(60))),
                              child: Center(
                                  child: Text(
                                'Ft',
                                style: TextStyle(
                                    color: unit == HeightE.foot
                                        ? darkDynamic?.primaryContainer
                                        : darkDynamic?.onPrimaryContainer),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              updateUnit(HeightE.cm);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: darkDynamic?.onSecondaryContainer
                                      .withOpacity(
                                          unit == HeightE.cm ? 1 : 0.3),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(60))),
                              child: Center(
                                  child: Text(
                                'Cm',
                                style: TextStyle(
                                    color: unit == HeightE.cm
                                        ? darkDynamic?.primaryContainer
                                        : darkDynamic?.onPrimaryContainer),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    (height.toInt() /
                            (unit == HeightE.inches
                                ? 2.54
                                : unit == HeightE.foot
                                    ? 30.48
                                    : 1))
                        .toStringAsFixed(1)
                        .toString(),
                    style: TextStyle(
                        color: darkDynamic?.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                        fontSize: 48),
                  ),
                  Slider(
                      value: height,
                      min: 100,
                      max: 240,
                      thumbColor: darkDynamic?.onSecondaryContainer,
                      inactiveColor: darkDynamic?.background,
                      activeColor:
                          darkDynamic?.onSecondaryContainer.withOpacity(0.4),
                      onChanged: (val) {
                        updateHeight(val);
                      })
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
