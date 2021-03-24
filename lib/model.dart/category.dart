import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class Category {
  final String title;
  final int doctorsNumber;
  final IconData icon;

  Category({
    @required this.title,
    @required this.doctorsNumber,
    @required this.icon,
  });
}
