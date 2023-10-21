import 'package:flutter/material.dart';

import '../../../theme/costom_app.dart';
import '../../../utils/constantsColor.dart';

class UserViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          'My Profile',
          style: AppThemes.profileAppBarTitle,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 5),
          child: Icon(
            Icons.more_vert,
            color: AppConstantsColor.darkTextColor,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
