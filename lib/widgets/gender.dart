import 'package:bmi_calculator/types/types.dart';
import 'package:bmi_calculator/utils/vars.dart';
import 'package:bmi_calculator/widgets/genderbox.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  final GenderE selectedGender;
  final dynamic updateGender;
  const Gender(
      {super.key, required this.selectedGender, required this.updateGender});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - offset;

    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GenderBox(
                icon: Icons.male,
                gender: GenderE.male,
                isSelected: widget.selectedGender == GenderE.male,
                onTap: widget.updateGender),
            GenderBox(
                icon: Icons.female,
                gender: GenderE.female,
                isSelected: widget.selectedGender == GenderE.female,
                onTap: widget.updateGender)
          ],
        ),
      );
    });
  }
}
