import 'package:course_app/model/course.dart';
import 'package:flutter/material.dart';

class Assets {
  static const imgAvatar = "assets/images/avatar.png";
  static const imgBackend = "assets/images/backend.jpg";
  static const imgFrontend = "assets/images/frontend.jpg";

  static const courseType = [
    {
      "title":"Backend",
      "image":"assets/images/backend.jpg",
      "modul":12
    },
    {
      "title":"Frontend",
      "image":"assets/images/frontend.jpg",
      "modul":8
    }
  ];

  static const professor = {
    "assets/images/prof1.png",
    "assets/images/prof2.png",
    "assets/images/prof3.png",
    "assets/images/prof4.png",
  };

  static final List<Course> courses = [
    Course(
        type: ["Frontend"],
        name: "Flutter",
        image: "assets/images/logo_flutter.png",
        duration: "8 Hours 40 Min",
        modul: 17,
        color: Colors.cyan),
    Course(
        type: ["Frontend"],
        name: "Dart",
        image: "assets/images/logo_dart.png",
        duration: "9 Hours 30 Min",
        modul: 17,
        color: Colors.cyan),
    Course(
        type: ["Backend", "Frontend"],
        name: "Java",
        image: "assets/images/logo_java.png",
        duration: "10 Hours",
        modul: 17,
        color: Colors.cyan),
    Course(
        type: ["Backend", "Frontend"],
        name: "Kotlin",
        image: "assets/images/logo_kotlin.png",
        duration: "8 Hours 20 Min",
        modul: 17,
        color: Colors.cyan),
    Course(
        type: ["Backend"],
        name: "Php",
        image: "assets/images/logo_php.png",
        duration: "7 Hours 10 Min",
        modul: 17,
        color: Colors.cyan),
  ];
}
