import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_confige.dart';
import 'dart:math' as math;

class BottomNavigation extends StatelessWidget {
  final List<IconData> itemIcons;
  final IconData centerIcon;
  final int selectedIndex;
  final Function(int) onItemPressed;
  const BottomNavigation({
    Key key,
    @required this.itemIcons,
    @required this.centerIcon,
    @required this.selectedIndex,
    @required this.onItemPressed,
  }) : assert(itemIcons.length != 3, "Item must equal 4");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getRelativeHeight(0.1),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: getRelativeHeight(0.07),
              color: Colors.white,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getRelativeWidth(0.1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              onItemPressed(0);
                            },
                            child: Icon(
                              itemIcons[0],
                              color: selectedIndex == 0
                                  ? kPrimaryDarkColor
                                  : kLightTextColor,
                              size: getRelativeWidth(0.07),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              onItemPressed(1);
                            },
                            child: Icon(
                              itemIcons[1],
                              color: selectedIndex == 1
                                  ? kPrimaryDarkColor
                                  : kLightTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 3),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              onItemPressed(2);
                            },
                            child: Icon(
                              itemIcons[2],
                              color: selectedIndex == 2
                                  ? kPrimaryDarkColor
                                  : kLightTextColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              onItemPressed(3);
                            },
                            child: Icon(
                              itemIcons[3],
                              color: selectedIndex == 3
                                  ? kPrimaryDarkColor
                                  : kLightTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Transform.rotate(
                angle: -math.pi / 4,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 25,
                        offset: Offset(0, 5),
                        color: kPrimaryDarkColor.withOpacity(0.75),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        kPrimarylightColor,
                        kPrimaryDarkColor,
                      ],
                    ),
                  ),
                  height: getRelativeWidth(0.135),
                  width: getRelativeWidth(0.135),
                  child: Center(
                      child: Transform.rotate(
                    angle: math.pi / 4,
                    child: Icon(
                      centerIcon,
                      color: Colors.white,
                      size: getRelativeWidth(0.07),
                    ),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
