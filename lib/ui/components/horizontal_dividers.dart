import 'package:flutter/material.dart';
import 'package:medicon/ui/utils/colors.dart';

class HorizontalDivider extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? color;
  final double? indent;
  final double? leftEndIndent;
  final double? rightEndIndent;
  final double? thickness;


   const HorizontalDivider({super.key, 
    this.text = "",
    this.textColor = AppColors.grey,
    this.color = AppColors.grey,
    this.indent = 10.0,
    this.leftEndIndent = 10.0,
    this.rightEndIndent = 10.0,
    this.thickness = 1.0});


  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Expanded(
          child: Divider(
                  indent: indent,
                  endIndent: leftEndIndent,
                  thickness: thickness,
                  color: color,
                ),
        ),
        Text(
            text,
            style: TextStyle(color: textColor),
        ),
        Expanded(
            child: Divider(
                    indent: indent,
                    endIndent: rightEndIndent,
                    thickness: thickness,
                    color: color,
            ),
        ),
      ],
    );
  }
}