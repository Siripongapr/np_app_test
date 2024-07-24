import 'package:flutter/material.dart';
import 'package:np_app_test/widget/colors.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,
            size: 18,
            color: icon == Icons.circle_outlined
                ? Colors.yellow.withOpacity(0.5)
                : icon == Icons.location_on_outlined
                    ? AppPalette.primaryGreen.withOpacity(0.5)
                    : Colors.red.withOpacity(0.5)),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(color: Colors.black.withOpacity(0.5)),
        ),
      ],
    );
  }
}
