import 'package:flutter/material.dart';
import 'package:fooddelivary/home/food_page_body.dart';
import 'package:fooddelivary/utils/colors.dart';
import 'package:fooddelivary/widgets/big_text.dart';
import 'package:fooddelivary/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(//color changing place in app bar
            child: Container(
              margin: EdgeInsets.only(top: 45,bottom: 15),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Sri Lanaka",color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "Bibile",color: Colors.black,),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor
                      ),
                      child: Icon(Icons.search,color: Colors.white,),
                    ),
                  )
                ],
              ),
            ),
          ),
          FoodPageBody()
        ],
      )
    );
  }
}
