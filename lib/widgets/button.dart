import 'package:bmi_calculator/utils/vars.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class BmiButton extends StatelessWidget {
  String text;
  IconData icon;
  dynamic onTap;
  BmiButton(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - offset + 5;
    return Material(
      color: Colors.transparent,
      child: DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
          return InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: darkDynamic?.primaryContainer,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 80,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,
                      style: TextStyle(
                          color: darkDynamic?.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    icon,
                    color: darkDynamic?.onPrimaryContainer,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
