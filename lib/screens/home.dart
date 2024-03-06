import 'package:bmi_calculator/screens/results.dart';
import 'package:bmi_calculator/types/types.dart';
import 'package:bmi_calculator/utils/getColors.dart';
import 'package:bmi_calculator/utils/vars.dart';
import 'package:bmi_calculator/widgets/button.dart';
import 'package:bmi_calculator/widgets/gender.dart';
import 'package:bmi_calculator/widgets/height.dart';
import 'package:bmi_calculator/widgets/plusminusunit.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  GenderE _gender = GenderE.male;
  double _height = 182.0;
  HeightE _unit = HeightE.cm;
  double _kilos = 70;
  double _age = 20;

  void initState() {
    super.initState();
  }

  void updateGender(GenderE gender) {
    setState(() {
      _gender = gender;
    });
  }

  void updateHeight(double height) {
    setState(() {
      _height = height;
    });
  }

  void updateUnit(HeightE unit) {
    setState(() {
      _unit = unit;
    });
  }

  void updateKilos(double value) {
    setState(() {
      _kilos = value;
    });
  }

  void updateAge(double value) {
    setState(() {
      _age = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return Container(
        decoration: BoxDecoration(color: darkDynamic!.background),
        height: double.infinity,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Gender(
                        updateGender: updateGender,
                        selectedGender: _gender,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Height(
                          height: _height,
                          updateHeight: updateHeight,
                          unit: _unit,
                          updateUnit: updateUnit),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlusMinusUnit(
                              title: 'Weight',
                              unit: 'kg',
                              initialValue: _kilos,
                              updateValue: updateKilos,
                            ),
                            PlusMinusUnit(
                              title: 'Age',
                              unit: 'Year',
                              initialValue: _age,
                              updateValue: updateAge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: BmiButton(
                    text: 'Calculate',
                    icon: Icons.cached,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Results(
                              gender: _gender,
                              height: _height,
                              unit: _unit,
                              kilos: _kilos,
                              age: _age),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
