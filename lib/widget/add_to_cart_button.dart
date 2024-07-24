// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:np_app_test/widget/colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.itemCount});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
        color: AppPalette.primaryGreen,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text("\$ ${itemCount * 14} | Add to cart",
            style: const TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
