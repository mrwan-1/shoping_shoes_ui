import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/custom_snackbars.dart';
import 'package:flutter_application_2/data/dummy_data.dart';
import 'package:flutter_application_2/model/models.dart';
import 'package:get/get.dart';

class AppMethods extends GetxController {
  AppMethods._();
  static void addToCart(ShowModel data, BuildContext context) {
    bool contains = itemsonBag.contains(data);
    if (contains) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBar.faildSnackBar());
    } else {
      itemsonBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBar.successSnackBar());
    }
  }

  static double allTheItemsOnBag() {
    double sumPrice = 0.0;
    for (ShowModel item in itemsonBag) {
      sumPrice += item.price;
    }
    return sumPrice;
  }
}
