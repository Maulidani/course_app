import 'package:flutter/material.dart';

class Course {
  List<String> type;
  String name;
  String image;
  String duration;
  int modul;
  Color color;

  Course({
    required this.type,
    required this.name,
    required this.image,
    required this.duration,
    required this.modul,
    required this.color,
  });

}