import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/menu');
                },
                child: const Text('Test 1')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/receipt');
                },
                child: const Text('Test 2'))
          ],
        ),
      ),
    );
  }
}
