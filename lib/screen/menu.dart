import 'package:flutter/material.dart';
import 'package:np_app_test/widget/add_to_cart_button.dart';
import 'package:np_app_test/widget/count_button.dart';
import 'package:np_app_test/widget/custom_app_bar.dart';
import 'package:np_app_test/widget/icon_with_text.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _rating = 5;
  int _itemCount = 0;
  String assetImage = 'assets/images/plate.webp';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth,
            child: Image.asset(
              assetImage,
              fit: BoxFit.contain,
            ),
          ),
          const CustomAppBar(),
          Positioned(
            top: screenHeight * 0.35,
            child: Container(
              width: screenWidth,
              height: screenHeight,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6.0)
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1,
                    vertical: screenHeight * 0.03),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Fruit nutrition meal',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _rating = index + 1;
                                  });
                                },
                                child: Icon(
                                  _rating > index ? Icons.star : Icons.star,
                                  color: _rating > index
                                      ? Colors.green
                                      : Colors.grey,
                                  size: 20.0,
                                ),
                              );
                            }),
                          ),
                          const SizedBox(width: 10),
                          const Text('4.5'),
                          const SizedBox(width: 10),
                          const Text('1287 comments')
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconWithText(
                            icon: Icons.circle_outlined,
                            text: 'Normal',
                          ),
                          IconWithText(
                            icon: Icons.location_on_outlined,
                            text: '1.7 km',
                          ),
                          IconWithText(
                            icon: Icons.update,
                            text: '32min',
                          ),
                        ],
                      ),
                      const Text('Introduce'),
                      const Text(
                          'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'),
                      TextButton(
                        style: const ButtonStyle(
                            padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Text('Expand'),
                            Icon(Icons.keyboard_arrow_down)
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.33,
            right: 30.0,
            child: SizedBox(
              width: 40,
              height: 40,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {},
                backgroundColor: Colors.lightGreen,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 231, 231, 231).withOpacity(0.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3,
                    child: CountButton(
                      onDecrement: () {
                        setState(() {
                          _itemCount = _itemCount > 0 ? _itemCount - 1 : 0;
                        });
                      },
                      onIncrement: () {
                        setState(() {
                          _itemCount++;
                        });
                      },
                      itemCount: _itemCount,
                    )),
                const SizedBox(width: 20),
                Expanded(
                    flex: 7,
                    child: AddToCartButton(
                      itemCount: _itemCount,
                    ))
              ],
            ),
          )),
    );
  }
}
