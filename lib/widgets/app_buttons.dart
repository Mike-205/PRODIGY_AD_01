import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final bool isBig;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Function()? onTap;
  final  double scaleFactor;

  const AppButtons({
    required this.text,
    this.isBig = false,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.textColor = const Color(0xDD000000),
    this.onTap,
    required this.scaleFactor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        width: (isBig == true? 180 : 80) * scaleFactor,
        height: 80 * scaleFactor,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30 * scaleFactor),
        ),

        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: (isBig == true? 35 : 40) * scaleFactor,
              fontWeight: FontWeight.w500,
              color: textColor
              )
            ),
          )
      ),
    );
  }
}