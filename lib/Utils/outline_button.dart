import 'package:ams/Utils/font_style.dart';
import 'package:ams/Utils/reusable_text.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget{

  const CustomOutlineButton({
    super.key,
    required this.width,
    required this.height,
    required this.buttonColor,
    required this.buttonBorderColor,
    required this.onPress,
    required this.buttonName,
    required this.buttonTextColor});

  final VoidCallback onPress;
  final double width;
  final double height;
  final Color? buttonColor;
  final Color buttonBorderColor;
  final Color buttonTextColor;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(width: 1,color:buttonBorderColor),
        ),
        child: Center(
          child: ReusableText(
              text: buttonName,
              style: fontStyle(14,buttonTextColor,FontWeight.normal)),
        ),
      ),
    );
  }}