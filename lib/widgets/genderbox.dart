import 'package:bmi_calculator/types/types.dart';
import 'package:bmi_calculator/utils/vars.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  GenderE gender = GenderE.male;
  IconData icon = Icons.male;
  bool isSelected = false;
  dynamic onTap;
  GenderBox({
    super.key,
    required this.gender,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - offset;
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return Material(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: InkWell(
              onTap: () {
                onTap(gender);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeIn,
                height: width / 1.8,
                width: width / 2,
                decoration: BoxDecoration(
                  color: isSelected
                      ? darkDynamic?.primaryContainer
                      : darkDynamic?.secondaryContainer,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 60,
                      color: isSelected
                          ? darkDynamic?.onPrimaryContainer
                          : darkDynamic?.onSecondaryContainer,
                    ),
                    AnimatedDefaultTextStyle(
                      style: TextStyle(
                          color: isSelected
                              ? darkDynamic?.onPrimaryContainer
                              : darkDynamic?.onSecondaryContainer,
                          fontSize: 18),
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeIn,
                      child: Text(
                        gender.name.toUpperCase(),
                        style: TextStyle(
                            color: isSelected
                                ? darkDynamic?.onPrimaryContainer
                                : darkDynamic?.onSecondaryContainer,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
