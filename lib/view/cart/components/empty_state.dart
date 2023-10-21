import 'package:flutter/material.dart';
import 'package:flutter_application_2/animation/fade_animations.dart';
import 'package:flutter_application_2/theme/costom_app.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      height: height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeAnimation(
            delay: 0.5,
            child: Text(
              'No Shoes added!',
              style: AppThemes.bagEmtyListTitle,
            ),
          ),
          FadeAnimation(
            delay: 0.5,
            child: Text(
              'Once you have added, come back:',
              style: AppThemes.bagEmtyListSubTitle,
            ),
          ),
        ],
      ),
    );
  }
}
