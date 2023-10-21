import 'package:flutter/material.dart';

import '../model/models.dart';

final List<ShowModel> availableShoes = [
  ShowModel(
    name: "NAIK",
    model: "MAX",
    price: 130.00,
    imagAdress: "assets/image/5.png",
    modelColor: const Color(0xffde0106),
  ),
  ShowModel(
    name: "NAIK",
    model: "Midiam",
    price: 130.00,
    imagAdress: "assets/image/2.png",
    modelColor: Color.fromARGB(255, 25, 24, 100),
  ),
  ShowModel(
    name: "NAIK",
    model: "AIR",
    price: 130.00,
    imagAdress: "assets/image/3.png",
    modelColor: Color.fromARGB(255, 33, 118, 187),
  ),
  ShowModel(
    name: "NAIK",
    model: "AI",
    price: 130.00,
    imagAdress: "assets/image/4.png",
    modelColor: Color.fromARGB(255, 56, 133, 46),
  ),
  ShowModel(
    name: "NAIK",
    model: "AX",
    price: 130.00,
    imagAdress: "assets/image/1.png",
    modelColor: Color.fromARGB(255, 201, 198, 38),
  ),
];

List<ShowModel> itemsonBag = [];

final List<UserStatus> userStatus = [
  UserStatus(
      emoji: '.',
      text: "Away",
      selectColor: const Color(0xff1221212),
      unSelectColor: const Color(0xffbfbfbf)),
  UserStatus(
      emoji: '..',
      text: "AT WORK",
      selectColor: const Color(0xff05a35c),
      unSelectColor: const Color(0xffbfbfbf)),
  UserStatus(
      emoji: '...',
      text: "Gaming",
      selectColor: const Color(0xffFFD237),
      unSelectColor: const Color(0xffbfbfbf)),
];

final List categories = [
  'Naik',
  'Adidas',
  'Jorden',
  'Gucci',
  'Tom Ford',
  'Koio'
];

final List featured = ['New', 'Featured', 'Upcoming'];

final List<double> sizes = [6, 7, 5, 8, 9.5];
