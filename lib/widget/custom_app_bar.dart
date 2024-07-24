import 'package:flutter/material.dart';
import 'package:np_app_test/widget/app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      actions: const [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppbarIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
                AppbarIcon(
                  icon: Icons.chevron_left,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
