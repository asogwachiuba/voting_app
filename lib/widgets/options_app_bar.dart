import 'package:flutter/material.dart';
import 'package:voting_app/constants/font.dart';
import 'package:voting_app/gen/assets.gen.dart';

class OptionsAppBar extends StatelessWidget {
  const OptionsAppBar({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        // Back button and title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Assets.icBack
                      .svg(height: 15, width: 17, fit: BoxFit.fill)),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: CustomFont.smallestFontSize,
              height: 2,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
