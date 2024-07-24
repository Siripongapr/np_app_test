// ignore: must_be_immutable
import 'package:flutter/material.dart';

class CountButton extends StatelessWidget {
  const CountButton({
    super.key,
    required this.itemCount,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int itemCount;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

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
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onDecrement,
            color: Colors.grey,
            icon: const Icon(
              Icons.remove,
            ),
          ),
          Text(itemCount.toString(), style: const TextStyle(fontSize: 20)),
          IconButton(
            onPressed: onIncrement,
            icon: const Icon(
              Icons.add,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
