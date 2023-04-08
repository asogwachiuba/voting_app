import 'package:flutter/material.dart';
import 'package:voting_app/constants/color_list.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed_,
    required this.buttonName,
    this.buttonColor,
  });
  final VoidCallback onPressed_;
  final String buttonName;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed_,
      style: ElevatedButton.styleFrom(
        primary: buttonColor ?? ColorList.darkGreen.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        buttonName,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
