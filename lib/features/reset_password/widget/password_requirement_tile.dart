import 'package:flutter/material.dart';
import 'package:voting_app/gen/assets.gen.dart';

class PasswordRequirementTile extends StatelessWidget {
  const PasswordRequirementTile({
    Key? key,
    required this.passed,
    required this.requirement,
  }) : super(key: key);
  final String requirement;
  final bool passed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.check.svg(
          height: 10,
          width: 10,
          color: passed ? Colors.white : Colors.red,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          requirement,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
