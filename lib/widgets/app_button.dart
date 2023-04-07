import 'package:flutter/material.dart';
import 'package:voting_app/constants/color_list.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed_,
  });
  final VoidCallback onPressed_;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed_,
      style: ElevatedButton.styleFrom(
        primary: ColorList.darkGreen.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
