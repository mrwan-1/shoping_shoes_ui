import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/costom_app.dart';
import 'package:flutter_application_2/utils/constantsColor.dart';

class RoundedListTile extends StatelessWidget {
  const RoundedListTile({
    super.key,
    required this.leadingBackColor,
    required this.icon,
    required this.title,
    required this.trailing,
  });
  final Color leadingBackColor;
  final IconData icon;
  final String title;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 70,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: leadingBackColor,
            radius: 25,
            child: IconButton(
              onPressed: () {},
              icon: Icon(icon),
              color: AppConstantsColor.ligthTextColor,
            ),
          ),
          title: Text(
            title,
            style: AppThemes.profileRepeatedListTileTitle,
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
