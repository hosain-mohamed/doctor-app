import 'package:flutter/material.dart';

class Doctor {
  final String name, speciality, image;
  final int reviews;
  final int reviewScore;

  Doctor(
      {@required this.name,
      @required this.speciality,
      @required this.image,
      @required this.reviews,
      @required this.reviewScore});
}
