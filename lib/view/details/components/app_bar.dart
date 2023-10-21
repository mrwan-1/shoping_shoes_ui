import 'package:flutter/material.dart';

import '../../../theme/costom_app.dart';
import '../../../utils/constantsColor.dart';

class CustomDetailsViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomDetailsViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        "Niak",
        style: AppThemes.detailsAppBar,
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppConstantsColor.ligthTextColor,
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(65);
}
