import 'package:flutter/material.dart';
import 'package:voting_app/constants/color_list.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed_,
    required this.buttonName,
    this.buttonColor,
    this.borderRadius = 16,
    this.height,
    this.width,
    this.textStyle,
  });
  final VoidCallback onPressed_;
  final String buttonName;
  final Color? buttonColor;
  final double borderRadius;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed_,
      style: ElevatedButton.styleFrom(
        primary: buttonColor ?? const Color(0xFF07A53D),
        fixedSize: Size(width ?? double.infinity, height ?? double.infinity),
        minimumSize: Size(width ?? double.maxFinite, height ?? 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        buttonName,
        style: textStyle ??
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
      ),
    );
  }
}
