import 'package:flutter/material.dart';
import 'package:np_app_test/widget/app_bar_icon.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget {
  CustomAppBar({
    super.key,
    this.itemCount = 0,
  });
  int itemCount;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      actions: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBarIcon(
                  icon: Icons.chevron_left,
                  itemCount: widget.itemCount,
                ),
                AppBarIcon(
                  icon: Icons.shopping_cart_outlined,
                  itemCount: widget.itemCount,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// class CustomAppBar extends StatelessWidget {
//   CustomAppBar({
//     super.key,
//     this.itemCount = 0,
//   });
//   int itemCount;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       forceMaterialTransparency: true,
//       actions: [
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 25.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AppBarIcon(
//                   icon: Icons.chevron_left,
//                   itemCount: itemCount,
//                 ),
//                 AppBarIcon(
//                   icon: Icons.shopping_cart_outlined,
//                   itemCount: itemCount,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
