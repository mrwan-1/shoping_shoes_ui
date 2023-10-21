import 'package:flutter/material.dart';
import '../utils/constantsColor.dart';

class AppThemes {
  AppThemes._();

  static const TextStyle homeAppBar = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkTextColor,
  );

  static const TextStyle homeProductName = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w300,
    color: AppConstantsColor.ligthTextColor,
  );
  static const TextStyle homeProductModel = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.ligthTextColor,
  );
  static const TextStyle homeProductPrice = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppConstantsColor.darkTextColor,
  );

  static const TextStyle homeMoreText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkTextColor,
  );
  static const TextStyle homeGridNewText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: AppConstantsColor.ligthTextColor,
  );
  static const TextStyle homeGrideAndModel = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkTextColor,
  );
  static const TextStyle homeGridPrice = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkTextColor,
  );

  // Details
  static const TextStyle detailsAppBar = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppConstantsColor.ligthTextColor,
  );
  static const TextStyle detailsMoreText = TextStyle(
      height: 1,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline);

  static TextStyle detailsProductDescriptions =
      TextStyle(color: Colors.grey[600]);
// Bag
  static const TextStyle bagEmtyListTitle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w500);

  static const TextStyle bagEmtyListSubTitle =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w400);
  static const TextStyle bagTotal =
      TextStyle(fontSize: 35, fontWeight: FontWeight.bold);

  static const TextStyle bagProductModel = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: AppConstantsColor.darkTextColor);

  static const TextStyle bagProductPrice = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppConstantsColor.darkTextColor);
  static const TextStyle bagProductNumOfshoe = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: AppConstantsColor.darkTextColor);
  static const TextStyle bagTotalPrice = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppConstantsColor.darkTextColor);
  static const TextStyle bagSumOfItemOnBag = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppConstantsColor.darkTextColor);
//Profile
  static const TextStyle profileAppBarTitle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppConstantsColor.darkTextColor);
  static const TextStyle profileRepeatedListTileTitle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppConstantsColor.darkTextColor);
  static const TextStyle profileDevName = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
  );
}
