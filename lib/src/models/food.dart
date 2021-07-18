import 'package:flutter/material.dart';

class Food {
  final int id;
  final String name;
  final String imagePath;
  final double price;
  final double rating;
  final String description;
  final bool recommended;
  final Color bgColor;
  final Color textColor;

  const Food({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.rating,
    required this.description,
    required this.recommended,
    required this.bgColor,
    required this.textColor,
  });
}
