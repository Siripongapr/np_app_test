import 'package:flutter/material.dart';
import 'package:np_app_test/test1/widget/add_to_cart_button.dart';
import 'package:np_app_test/test1/widget/colors.dart';
import 'package:np_app_test/test1/widget/count_button.dart';
import 'package:np_app_test/test1/widget/custom_app_bar.dart';
import 'package:np_app_test/test1/widget/icon_with_text.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _rating = 5;
  int _itemCount = 0;
  int _maxLine = 3;
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
            height: screenHeight * 0.5,
            child: Image.asset(
              assetImage,
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: CustomAppBar(
              itemCount: _itemCount,
            ),
          ),
          Positioned(
            top: screenHeight * 0.44,
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
                    horizontal: screenWidth * 0.08,
                    vertical: screenHeight * 0.04),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Fruit nutrition meal',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _ratingWidget(),
                          const SizedBox(width: 15),
                          const Text(
                            '4.5',
                            style: TextStyle(color: Colors.black26),
                          ),
                          const SizedBox(width: 10),
                          const Text('1287 comments',
                              style: TextStyle(color: Colors.black26))
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 30),
                        child: Row(
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
                      ),
                      const Text('Introduce',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 60, 60, 60))),
                      const SizedBox(height: 15),
                      Text(
                        'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.8,
                            color: Colors.black.withOpacity(0.5)),
                        maxLines: _maxLine,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Visibility(
                        visible: _maxLine == 3,
                        child: TextButton(
                          style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                          onPressed: () {
                            setState(() {
                              _maxLine = 999;
                            });
                          },
                          child: Row(
                            children: [
                              Text('Expand',
                                  style: TextStyle(
                                      color: AppPalette.primaryGreen
                                          .withOpacity(0.8),
                                      fontSize: 15)),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: AppPalette.primaryGreen,
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.41,
            right: 30.0,
            child: SizedBox(
              width: 45,
              height: 45,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {},
                backgroundColor: AppPalette.primaryGreen,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 23,
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
                    flex: 4,
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

  Row _ratingWidget() {
    return Row(
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
            color: _rating > index ? AppPalette.primaryGreen : Colors.grey,
            size: 15.0,
          ),
        );
      }),
    );
  }
}
