import 'dart:ffi';

import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/types/types.dart';
import 'package:bmi_calculator/utils/suggestions.dart';
import 'package:bmi_calculator/utils/vars.dart';
import 'package:bmi_calculator/widgets/bmi.dart';
import 'package:bmi_calculator/widgets/button.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Results extends StatelessWidget {
  GenderE gender = GenderE.male;
  double height = 182.0;
  HeightE unit = HeightE.cm;
  double kilos = 70;
  double age = 20;
  Results(
      {super.key,
      required this.gender,
      required this.height,
      required this.unit,
      required this.kilos,
      required this.age});

  double getBMI() {
    return (kilos / ((height / 100) * (height / 100)));
  }

  String getBmiLevel() {
    double bmi = getBMI();
    switch (bmi) {
      case <= 18.5:
        return 'underweight';
      case >= 18.6 && <= 24.9:
        return 'healthy';
      case >= 25.0 && <= 29.9:
        return 'overweight';
      default:
        return 'obese';
    }
  }

  List<String> getSuggestions() {
    String level = getBmiLevel();
    switch (level) {
      case 'underweight':
        return underweightSuggestions;
      case 'healthy':
        return healthySuggestions;
      case 'overweight':
        return overweightSuggestions;
      default:
        return obeseSuggestions;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - offset;
    double height = MediaQuery.of(context).size.height;

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(color: darkDynamic!.background),
            height: double.infinity,
            child: SafeArea(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 180,
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  darkDynamic.onBackground, BlendMode.srcIn),
                              child: Image.asset(
                                "assets/logo.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Text(
                                'Result',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: darkDynamic?.onBackground),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        BMI(bmi: getBMI(), bmiRange: getBmiLevel()),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Text(
                                getBmiLevel().capitalize(),
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: darkDynamic?.onBackground),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            height: height / 2 - 80,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: getSuggestions().length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "${index + 1}. ${getSuggestions()[index]}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: darkDynamic?.onBackground),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: BmiButton(
                        text: 'Re-Calculate',
                        icon: Icons.subdirectory_arrow_left,
                        onTap: () {
                          Navigator.pop(context);
                        }),
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
