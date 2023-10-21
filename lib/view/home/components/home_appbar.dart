import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/costom_app.dart';
import '../../../utils/constantsColor.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(top: 6.0),
        child: Text(
          "Discover",
          style: AppThemes.homeAppBar,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.search,
            size: 25,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.bell,
            size: 25,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
