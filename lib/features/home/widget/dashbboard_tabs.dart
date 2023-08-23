import 'package:flutter/material.dart';
import 'package:voting_app/constants/font.dart';
import 'package:voting_app/widgets/app_button.dart';

class DashboardTabs extends StatelessWidget {
  const DashboardTabs({
    super.key,
    required this.icons,
    required this.title,
    required this.subtitle,
    required this.onPresed,
  });
  final String title;
  final String subtitle;
  final Widget icons;
  final VoidCallback onPresed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 1,
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              children: [
                icons,
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: CustomFont.smallestFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(
              buttonName: 'Proceed',
              height: 45,
              borderRadius: 10,
              onPressed_: () {
                onPresed();
              },
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
