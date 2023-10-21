import 'package:flutter/material.dart';
import 'package:flutter_application_2/animation/fade_animations.dart';
import 'package:flutter_application_2/data/dummy_data.dart';
import 'package:flutter_application_2/model/shoe_model.dart';
import 'package:flutter_application_2/theme/costom_app.dart';
import 'package:flutter_application_2/utils/app_methods.dart';
import 'package:flutter_application_2/utils/constantsColor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/app_bar.dart';

class DetailsView extends StatefulWidget {
  const DetailsView(
      {Key? key, required this.model, required this.isComfromMoreSection})
      : super(key: key);
  final ShowModel model;
  final bool isComfromMoreSection;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  bool _isCountrySelected = false;
  int? _isSizeSelected;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: CustomDetailsViewAppBar(),
        body: SizedBox(
          width: size.width,
          height: size.height * 1.1,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _topProductImageAndBg(size),
                _morePicofProduct(size),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProductNameAndPrice(),
                      _productInfo(size.width, size.height),
                      _moreDetailsText(size.width, size.height),
                      _sizeAndCountrySelectionSection(size),
                      _bottomSizeSelection(size),
                      _addToBagButton(size)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _addToBagButton(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: FadeAnimation(
          delay: 3.5,
          child: MaterialButton(
            color: widget.model.modelColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            minWidth: size.width / 1.2,
            height: size.height / 15,
            onPressed: () {
              AppMethods.addToCart(widget.model, context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.cartShopping,
                  color: AppConstantsColor.ligthTextColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'اضافه الئ السله',
                  style: TextStyle(
                      fontSize: 17, color: AppConstantsColor.ligthTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomSizeSelection(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      width: size.width,
      height: size.height * 0.07,
      child: FadeAnimation(
        delay: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width / 4.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'try it',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    RotatedBox(
                      quarterTurns: -1,
                      child: FaIcon(FontAwesomeIcons.shoePrints),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.7,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSizeSelected = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      width: size.width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1.5,
                            color: _isSizeSelected == index
                                ? Colors.black
                                : Colors.grey),
                        color: _isSizeSelected == index
                            ? Colors.black
                            : AppConstantsColor.backgroundColor,
                      ),
                      child: Center(
                        child: Text(
                          sizes[index].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: _isSizeSelected == index
                                  ? Colors.grey
                                  : Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _sizeAndCountrySelectionSection(Size size) {
    return FadeAnimation(
      delay: 2.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Size',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppConstantsColor.darkTextColor,
                  fontSize: 22),
            ),
            SizedBox(
              width: size.width * 0.35,
              height: size.height * 0.05,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isCountrySelected = false;
                      });
                    },
                    child: Text(
                      'UK',
                      style: TextStyle(
                          fontWeight: _isCountrySelected
                              ? FontWeight.w400
                              : FontWeight.bold,
                          color: _isCountrySelected
                              ? Colors.grey
                              : AppConstantsColor.darkTextColor,
                          fontSize: 19),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isCountrySelected = true;
                      });
                    },
                    child: Text(
                      'USA',
                      style: TextStyle(
                          fontWeight: !_isCountrySelected
                              ? FontWeight.w400
                              : FontWeight.bold,
                          color: !_isCountrySelected
                              ? Colors.grey
                              : AppConstantsColor.darkTextColor,
                          fontSize: 19),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _moreDetailsText(width, heigth) {
    return FadeAnimation(
      delay: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Text(
          'MORE DETAILS',
          style: AppThemes.detailsMoreText,
        ),
      ),
    );
  }

  Widget _productInfo(width, heigth) {
    return FadeAnimation(
      delay: 1.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: SizedBox(
          width: width,
          height: heigth / 9,
          child: Text(
            "Indescribable elegance and comfort. The Gamma Force combines suede and real and synthetic leather in a new look taken from the classic AF-1. They come with Nike Grind accents on the outsole and a shiny plastic clip on the heel for a modern touch.",
            style: AppThemes.detailsProductDescriptions,
          ),
        ),
      ),
    );
  }

  Widget _ProductNameAndPrice() {
    return FadeAnimation(
        delay: 1,
        child: Row(
          children: [
            Text(
              widget.model.model,
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: AppConstantsColor.darkTextColor),
            ),
            Expanded(child: Container()),
            Text(
              '\$${widget.model.price.toStringAsFixed(2)}',
              style: AppThemes.detailsProductDescriptions,
            )
          ],
        ));
  }

  Widget _morePicofProduct(Size size) {
    return FadeAnimation(
      delay: 0.5,
      child: SizedBox(
        width: size.width,
        height: size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              4,
              (index) => index == 3
                  ? Container(
                      padding: EdgeInsets.all(2),
                      width: size.width / 5,
                      height: size.height / 14,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        image: DecorationImage(
                          image: AssetImage(widget.model.imagAdress),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.grey.withOpacity(1), BlendMode.darken),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.play_circle_fill,
                          color: AppConstantsColor.ligthTextColor,
                          size: 30,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      child: roundedImage(size.width, size.height),
                    )),
        ),
      ),
    );
  }

  Widget _topProductImageAndBg(Size size) {
    return SizedBox(
      // color: Colors.yellow.withOpacity(0.2),
      width: size.width,
      height: size.height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 60,
            bottom: 20,
            child: FadeAnimation(
              delay: 0.5,
              child: Container(
                width: size.width,
                height: size.height / 2.2,
                decoration: BoxDecoration(
                    color: widget.model.modelColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(1500),
                      topLeft: Radius.circular(10),
                    )),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 30,
            child: Hero(
              tag: widget.isComfromMoreSection
                  ? widget.model.model
                  : widget.model.imagAdress,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(-20 / 360),
                child: SizedBox(
                    width: size.width / 1.3,
                    height: size.height / 4.3,
                    child: Image(image: AssetImage(widget.model.imagAdress))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget roundedImage(width, heigth) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: heigth / 14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Image(image: AssetImage(widget.model.imagAdress)),
    );
  }
}
