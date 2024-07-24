import 'package:flutter/material.dart';
import 'package:np_app_test/widget/colors.dart';

// ignore: must_be_immutable
class AppBarIcon extends StatefulWidget {
  AppBarIcon({super.key, required this.icon, this.itemCount = 0});
  final IconData icon;
  int itemCount;
  @override
  State<AppBarIcon> createState() => _AppBarIconState();
}

class _AppBarIconState extends State<AppBarIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
          icon: Icon(widget.icon),
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white70),
          )),
      if (widget.itemCount > 0 && widget.icon == Icons.shopping_cart_outlined)
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: const BoxDecoration(
              color: AppPalette.primaryGreen,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            constraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            child: Center(
              child: Text(
                '${widget.itemCount}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
    ]);
  }
}
// class AppBarIcon extends StatelessWidget {
//   AppBarIcon({super.key, required this.icon, this.itemCount = 0});
//   final IconData icon;
//   int itemCount;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       IconButton(
//           icon: Icon(icon),
//           onPressed: () {},
//           style: ButtonStyle(
//             backgroundColor: WidgetStateProperty.all(Colors.white70),
//           )),
//       if (itemCount > 0)
//         Positioned(
//           right: 0,
//           child: Container(
//             padding: const EdgeInsets.all(1),
//             decoration: const BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             constraints: const BoxConstraints(
//               minWidth: 20,
//               minHeight: 20,
//             ),
//             child: Center(
//               child: Text(
//                 '$itemCount',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ),
//     ]);
//   }
// }
