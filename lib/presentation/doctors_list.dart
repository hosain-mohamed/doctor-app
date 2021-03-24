import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctor_app/data/data.dart';

import '../constants.dart';
import '../size_confige.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getRelativeHeight(0.35),
      child: ListView.builder(
        itemCount: Data.doctorsList.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: getRelativeWidth(0.035)),
        itemBuilder: (context, index) {
          final doctor = Data.doctorsList[index];
          final color = kCategoriesSecondryColor[
              (kCategoriesSecondryColor.length - index - 1)];
          final circleColor = kCategoriesPrimaryColor[
              (kCategoriesPrimaryColor.length - index - 1)];
          final cardWidth = getRelativeWidth(0.48);
          return Row(
            children: [
              Container(
                width: cardWidth,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                    color: color,
                                  ),
                                  height: getRelativeHeight(0.14),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          width: getRelativeHeight(0.13),
                                          height: getRelativeHeight(0.13),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 15,
                                                color: circleColor
                                                    .withOpacity(0.6)),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: getRelativeHeight(0.11),
                                          height: getRelativeHeight(0.11),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 15,
                                                color: circleColor
                                                    .withOpacity(0.25)),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: getRelativeHeight(0.11),
                                          height: getRelativeHeight(0.11),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 15,
                                                color: circleColor
                                                    .withOpacity(0.17)),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                width: cardWidth,
                                height: getRelativeHeight(0.19),
                                child: Image.asset(doctor.image)),
                          ],
                        ),
                        Container(
                          height: getRelativeHeight(0.12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: getRelativeHeight(0.02),
                                horizontal: getRelativeWidth((0.05))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctor.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kHardTextColor,
                                      fontSize: getRelativeWidth(0.041)),
                                ),
                                SizedBox(height: getRelativeHeight(0.005)),
                                Text(
                                  doctor.speciality,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: getRelativeWidth(0.032)),
                                ),
                                SizedBox(height: getRelativeHeight(0.005)),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      unratedColor:
                                          Colors.grey.withOpacity(0.5),
                                      itemSize: getRelativeWidth(0.035),
                                      initialRating:
                                          doctor.reviewScore.toDouble(),
                                      minRating: 0,
                                      allowHalfRating: true,
                                      direction: Axis.horizontal,
                                      itemPadding: EdgeInsets.symmetric(
                                          horizontal: getRelativeWidth(0.005)),
                                      itemCount: 5,
                                      updateOnDrag: false,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      onRatingUpdate: (value) {},
                                    ),
                                    SizedBox(width: getRelativeWidth(0.01)),
                                    Text(
                                      "(${doctor.reviews} Reviews)",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontSize: getRelativeWidth(0.022)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: getRelativeHeight(0.04))
                              .copyWith(left: cardWidth * 0.7),
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                offset: Offset(0, 3),
                                color: Colors.black26,
                              )
                            ], color: Colors.white, shape: BoxShape.circle),
                            padding: EdgeInsets.all(getRelativeWidth(0.015)),
                            child: Icon(
                              FontAwesomeIcons.facebookMessenger,
                              color: color,
                              size: getRelativeWidth(0.055),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: getRelativeWidth(0.04))
            ],
          );
        },
      ),
    );
  }
}
