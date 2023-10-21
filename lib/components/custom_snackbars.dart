import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/dummy_data.dart';
import 'package:flutter_application_2/model/models.dart';

class CustomSnackBar {
  CustomSnackBar._();

  static successSnackBar() => SnackBar(
        backgroundColor: Colors.green[400],
        content: Text('Successfully Added to your bag!'),
        action: SnackBarAction(
            textColor: Colors.white, label: 'Got it', onPressed: () {}),
      );

  static faildSnackBar() => SnackBar(
        backgroundColor: Colors.red[400],
        content: Text('you have added this item before!'),
        action: SnackBarAction(
            textColor: Colors.white, label: 'Got it', onPressed: () {}),
      );
}
