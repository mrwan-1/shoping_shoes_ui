import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/animation/fade_animations.dart';
import 'package:flutter_application_2/data/dummy_data.dart';
import 'package:flutter_application_2/model/shoe_model.dart';
import 'package:flutter_application_2/theme/costom_app.dart';
import 'package:flutter_application_2/utils/constantsColor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../details/details_view.dart';
import 'home_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOffeatured = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      appBar: HomeAppBar(),
      body: Column(
        children: [
          _categoryView(size),
          SizedBox(
            height: size.height * 0.4,
            child: _mainShoesListView(size),
          ),
          _moreTextAndIcon(),
          _bottomSideCategory(size)
        ],
      ),
    ));
  }

  SizedBox _bottomSideCategory(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.31,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: availableShoes.length,
        itemBuilder: (context, index) {
          ShowModel model = availableShoes[index];
          return GestureDetector(
            onTap: () {
              Get.to(DetailsView(
                model: model,
                isComfromMoreSection: true,
              ));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: size.width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 4,
                    child: FadeAnimation(
                      delay: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(9))),
                        width: size.width / 13,
                        height: size.height / 10,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: FadeAnimation(
                              delay: 1,
                              child: Text(
                                "NEW",
                                style: AppThemes.homeGridNewText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 5,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: AppConstantsColor.darkTextColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 10,
                    child: FadeAnimation(
                      delay: 1,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(-13 / 360),
                        child: Hero(
                          tag: model.model,
                          child: Image(
                            image: AssetImage(
                              model.imagAdress,
                            ),
                            width: size.width * 0.45,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    child: FadeAnimation(
                      delay: 1.6,
                      child: FittedBox(
                        child: Text(
                          "${model.name} ${model.model}",
                          style: AppThemes.homeGrideAndModel,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: FadeAnimation(
                      delay: 2.4,
                      child: FittedBox(
                        child: Text(
                          "${model.price}",
                          style: AppThemes.homeGridPrice,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _moreTextAndIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "More",
            style: AppThemes.homeMoreText,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.arrow_right,
                size: 27,
              ))
        ],
      ),
    );
  }

  Row _mainShoesListView(Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: SizedBox(
            width: size.width / 16,
            height: size.height * 2.4,
            child: RotatedBox(
              quarterTurns: -1,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: featured.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndexOffeatured = index;
                          });
                        },
                        child: Text(
                          featured[index],
                          style: TextStyle(
                              fontSize:
                                  selectedIndexOffeatured == index ? 21 : 18,
                              color: selectedIndexOffeatured == index
                                  ? AppConstantsColor.darkTextColor
                                  : AppConstantsColor.ligthTextColor,
                              fontWeight: selectedIndexOffeatured == index
                                  ? FontWeight.w600
                                  : FontWeight.w400),
                        )),
                  );
                },
              ),
            ),
          ),
        ),
        Container(
          width: size.width * 0.89,
          height: size.height,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: availableShoes.length,
            itemBuilder: (context, index) {
              ShowModel model = availableShoes[index];
              return GestureDetector(
                onTap: () {
                  Get.to(DetailsView(
                    model: model,
                    isComfromMoreSection: false,
                  ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: size.height * 0.005,
                      vertical: size.height * 0.01),
                  width: size.width / 1.5,
                  child: Stack(
                    children: [
                      Container(
                        width: size.width / 1.81,
                        decoration: BoxDecoration(
                            color: model.modelColor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Positioned(
                        left: 10,
                        child: FadeAnimation(
                          delay: 1,
                          child: Row(
                            children: [
                              Text(
                                model.name,
                                style: AppThemes.homeProductName,
                              ),
                              SizedBox(
                                width: size.width * 0.3,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 40,
                          left: 10,
                          child: FadeAnimation(
                              delay: 1,
                              child: Text(
                                model.model,
                                style: AppThemes.homeProductModel,
                              ))),
                      Positioned(
                          top: 80,
                          left: 10,
                          child: FadeAnimation(
                              delay: 2,
                              child: Text(
                                model.price.toStringAsFixed(2),
                                style: AppThemes.homeProductModel,
                              ))),
                      Positioned(
                        top: 50,
                        right: 10,
                        child: FadeAnimation(
                          delay: 2.3,
                          child: Hero(
                            tag: model.imagAdress,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(-30 / 360),
                              child: SizedBox(
                                width: 250,
                                height: 230,
                                child:
                                    Image(image: AssetImage(model.imagAdress)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          left: 170,
                          child: IconButton(
                              onPressed: () {},
                              icon: FaIcon(
                                FontAwesomeIcons.arrowCircleRight,
                                color: Colors.white,
                                size: 25,
                              )))
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _categoryView(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: size.width * 0.07,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndexOfCategory = index;
                      });
                    },
                    child: Text(
                      categories[index],
                      style: TextStyle(
                          fontSize: selectedIndexOfCategory == index ? 21 : 18,
                          color: selectedIndexOfCategory == index
                              ? AppConstantsColor.darkTextColor
                              : AppConstantsColor.ligthTextColor,
                          fontWeight: selectedIndexOfCategory == index
                              ? FontWeight.w600
                              : FontWeight.w400),
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
