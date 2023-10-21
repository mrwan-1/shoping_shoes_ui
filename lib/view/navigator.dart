import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/constantsColor.dart';
import 'package:flutter_application_2/view/cart/bag_viwe.dart';
import 'package:flutter_application_2/view/user_profile/user_profile_view.dart';
import 'view.dart';

class MainNvigator extends StatefulWidget {
  const MainNvigator({super.key});

  @override
  State<MainNvigator> createState() => _MainNvigatorState();
}

class _MainNvigatorState extends State<MainNvigator> {
  PageController _pageController = PageController();
  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
    // _pageController.jumpToPage(_selectIndex);
    _pageController.animateToPage(_selectIndex,
        duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _screens = [
    HomeView(),
    BagView(),
    UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CustomNavigationBar(
          currentIndex: _selectIndex,
          onTap: _onItemTapped,
          iconSize: 27,
          bubbleCurve: Curves.linear,
          selectedColor: AppConstantsColor.materialButtonColor,
          strokeColor: AppConstantsColor.materialButtonColor,
          unSelectedColor: Color(0xffacacac),
          backgroundColor: Colors.white,
          scaleFactor: 0.1,
          items: [
            CustomNavigationBarItem(icon: Icon(Icons.home)),
            CustomNavigationBarItem(icon: Icon(Icons.shopping_cart)),
            CustomNavigationBarItem(icon: Icon(Icons.person))
          ]),
    );
  }
}
