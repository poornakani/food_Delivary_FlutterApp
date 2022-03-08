import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivary/utils/colors.dart';
import 'package:fooddelivary/utils/dimensions.dart';
import 'package:fooddelivary/widgets/big_text.dart';
import 'package:fooddelivary/widgets/icons_and_text.dart';
import 'package:fooddelivary/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _curretPageValue = 0.0;
  double _scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _curretPageValue = pageController.page!;
        //print(_curretPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height.toString());
    return Column(
      children: [
        Container(
          // color: Colors.red,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _curretPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius5)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _curretPageValue.floor()) {
      //current slide
      var currentScale = 1 - (_curretPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _curretPageValue.floor() + 1) {
      //next slide
      var currentScale =
          _scaleFactor + (_curretPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _curretPageValue.floor() - 1) {
      //next slide
      var currentScale = 1 - (_curretPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.amber,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/food0.png"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.heigth30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(5, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height10, left: Dimensions.width15, right: Dimensions.width15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "chinese Slide",
                      color: AppColors.mainBlackColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 15,
                                  )),
                        ),
                        SizedBox(
                          width: Dimensions.width20,
                        ),
                        SmallText(text: "4.5"),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        SmallText(text: "12587"),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        SmallText(text: "comments"),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: AppColors.iconColor1),
                        SizedBox(
                          width: Dimensions.width10,

                        ),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.7Km",
                            iconColor: AppColors.iconColor2),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        IconAndTextWidget(
                            icon: Icons.access_time_filled_rounded,
                            text: "32min",
                            iconColor: Colors.red),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
