import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../size_confige.dart';

class SearchField extends StatelessWidget {
  SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getRelativeWidth(0.88),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: getRelativeHeight(0.02)),
              fillColor: Colors.white,
              filled: true,
              hintText: "Search Doctor",
              hintStyle: TextStyle(
                fontSize: getRelativeWidth(0.046),
                color: Colors.blueGrey.withOpacity(0.9),
              ),
              prefixIcon: Icon(
                LineIcons.search,
                color: Colors.blueGrey.withOpacity(0.9),
                size: getRelativeWidth(0.065),
              ),
              suffixIcon: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getRelativeWidth(0.03)),
                child: Container(
                  width: getRelativeWidth(0.26),
                  height: getRelativeHeight(0.01),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffFBA473), Color(0xffFA7A30)]),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getRelativeWidth(0.025)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Filter",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: getRelativeWidth(0.04)),
                        ),
                        Icon(
                          Icons.filter_list,
                          color: Colors.white,
                          size: getRelativeWidth(0.055),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              border: outlineBorder,
              enabledBorder: outlineBorder,
              focusedBorder: outlineBorder),
        ),
      ),
    );
  }

  final outlineBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(30),
  );
}
