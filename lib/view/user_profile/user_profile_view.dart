import 'package:flutter/material.dart';
import 'package:flutter_application_2/animation/fade_animations.dart';
import 'package:flutter_application_2/data/dummy_data.dart';
import 'package:flutter_application_2/model/models.dart';
import 'package:flutter_application_2/theme/costom_app.dart';
import 'package:flutter_application_2/utils/constantsColor.dart';
import 'package:flutter_application_2/view/user_profile/components/rounded_list_tile.dart';

import 'components/app_bar.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int statusCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      appBar: UserViewAppBar(),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
          child: Column(
            children: [
              _topUserInfo(width),
              SizedBox(
                height: height * 0.01,
              ),
              _userStatusListView(height, width),
              SizedBox(
                height: height * 0.01,
              ),
              _roundedList(width, height),
              FadeAnimation(
                  delay: 2,
                  child: SizedBox(
                    width: width,
                    height: height / 6.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Account',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          'Switch to Other Account',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue[600]),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Text(
                          'Loge Out',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.red[500]),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _roundedList(double width, double height) {
    return FadeAnimation(
      delay: 2,
      child: Container(
        width: width,
        height: height * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashbord',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            RoundedListTile(
              leadingBackColor: Colors.green,
              icon: Icons.wallet_travel_outlined,
              title: 'Payments',
              trailing: Container(
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '2 New',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppConstantsColor.ligthTextColor),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstantsColor.ligthTextColor,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            RoundedListTile(
              leadingBackColor: Colors.yellow,
              icon: Icons.archive,
              title: 'AchieveMents',
              trailing: Container(
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstantsColor.darkTextColor,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            RoundedListTile(
              leadingBackColor: Colors.grey,
              icon: Icons.shield,
              title: 'Privacy',
              trailing: Container(
                width: 160,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.red[400]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Action Needed',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppConstantsColor.ligthTextColor),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstantsColor.ligthTextColor,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userStatusListView(double height, double width) {
    return FadeAnimation(
        delay: 1.5,
        child: SizedBox(
          height: height * 0.12,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Status',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[300]),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Container(
                width: width,
                height: height * 0.08,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: userStatus.length,
                  itemBuilder: (context, index) {
                    UserStatus status = userStatus[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          statusCurrentIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 120,
                        decoration: BoxDecoration(
                          color: statusCurrentIndex == index
                              ? status.selectColor
                              : status.unSelectColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${status.emoji}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              status.text,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppConstantsColor.ligthTextColor),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }

  Widget _topUserInfo(double width) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: FadeAnimation(
        delay: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/image/profaile.png"),
            ),
            SizedBox(
              width: width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Marwan  Al-Khawlani',
                  style: AppThemes.profileDevName,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Flutter Develober',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_outlined,
                ))
          ],
        ),
      ),
    );
  }
}
