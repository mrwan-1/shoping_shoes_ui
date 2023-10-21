import 'package:flutter/material.dart';
import 'package:flutter_application_2/animation/fade_animations.dart';
import 'package:flutter_application_2/data/dummy_data.dart';
import 'package:flutter_application_2/model/models.dart';
import 'package:flutter_application_2/theme/costom_app.dart';
import 'package:flutter_application_2/utils/app_methods.dart';
import 'package:flutter_application_2/utils/constantsColor.dart';
import 'package:flutter_application_2/view/cart/components/empty_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BagView extends StatefulWidget {
  const BagView({super.key});

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  int lenthsofitemsonbag = itemsonBag.length;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          width: width,
          height: height,
          child: Column(
            children: [
              _bagAppBar(width, height),
              itemsonBag.isEmpty
                  ? const EmptyState()
                  : Column(
                      children: [
                        _mainProductList(width, height),
                        _bottomInfos(width, height)
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomInfos(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.13,
      child: Column(
        children: [
          FadeAnimation(
            delay: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: AppThemes.bagTotalPrice,
                ),
                Text(
                  '\$${AppMethods.allTheItemsOnBag()}',
                  style: AppThemes.bagSumOfItemOnBag,
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          materialbutton(width, height),
        ],
      ),
    );
  }

  Widget materialbutton(width, height) {
    return FadeAnimation(
        delay: 1.5,
        child: MaterialButton(
          minWidth: width / 1.2,
          height: height / 15,
          color: AppConstantsColor.materialButtonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {},
          child: Text(
            'NEXT',
            style: TextStyle(color: AppConstantsColor.ligthTextColor),
          ),
        ));
  }

  Widget _mainProductList(double width, double height) {
    return Container(
      width: width,
      height: height * 0.68,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: itemsonBag.length,
        itemBuilder: (context, index) {
          ShowModel currentBagItem = itemsonBag[index];
          return FadeAnimation(
            delay: 1.5 * (index / 4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 206, 206, 206)),
              ),
              margin: EdgeInsets.symmetric(vertical: 2),
              width: width,
              height: height * 0.2,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      width: 45,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(9),
                              bottomLeft: Radius.circular(25))),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              itemsonBag.remove(currentBagItem);
                              lenthsofitemsonbag = itemsonBag.length;
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            size: 25,
                            color: Colors.red[400],
                          )),
                    ),
                  ),
                  Row(
                    children: [
                      //item image
                      SizedBox(
                        width: width * 0.4,
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.all(21),
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: currentBagItem.modelColor
                                      .withOpacity(0.6)),
                            ),
                            Positioned(
                              right: 2,
                              bottom: 10,
                              child: RotationTransition(
                                turns: AlwaysStoppedAnimation(-40 / 360),
                                child: SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Image(
                                        image: AssetImage(
                                            currentBagItem.imagAdress))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      //information items
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentBagItem.model,
                            style: AppThemes.bagProductModel,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '\$${currentBagItem.price}',
                            style: AppThemes.bagProductPrice,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   if (numberItem > 1) {
                                  //     numberItem--;
                                  //   }
                                  // });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300]),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  '1',
                                  style: AppThemes.bagProductNumOfshoe,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // numberItem++;
                                    // AppMethods.allTheItemsOnBag(numberItem);
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300]),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _bagAppBar(double width, double height) {
    return SizedBox(
      width: width,
      height: height / 14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Bag',
            style: AppThemes.bagTotal,
          ),
          Text(
            'Total $lenthsofitemsonbag Items',
            style: AppThemes.bagTotalPrice,
          )
        ],
      ),
    );
  }
}
