import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(left: 0,right: 0,top: 0,
              child: Container(width: double.maxFinite,height: Dimensions.foodDetailImgSize,decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/food_0.jpg'), fit: BoxFit.cover)),)),
          Positioned(
              width: Dimensions.screenWidth,
              top: Dimensions.height20,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
              AppIcon(iconData: CupertinoIcons.back, iconColor: Colors.grey,),
              AppIcon(iconData: CupertinoIcons.shopping_cart, iconColor: Colors.grey,)
            ],
          )),
          Positioned(left: 0, right: 0, bottom: 0,top: Dimensions.foodDetailImgSize-30,
          child: Container(
                padding: EdgeInsets.only(top: Dimensions.height10, left: Dimensions.width20, right: Dimensions.width20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20),topRight: Radius.circular(Dimensions.radius20))),
                child:
                Column(
                  children: [
                    AppColumn(text: 'Chinese Food',),
                    SizedBox(height: Dimensions.height10,),
                    BigText(text: "Introduce"),
                    SizedBox(height: Dimensions.height10,),
                    Expanded(child: SingleChildScrollView(
                      child: ExpandableTextWidget(text: 'pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot')


                      ,))    ]
              ,)


          ),



    )],
      ),
      bottomNavigationBar:
      Container(height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.width20, right: Dimensions.width20),
          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20*2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20), color: Colors.white),
                padding:  EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.width20, right: Dimensions.width20, left: Dimensions.width20),
                margin: EdgeInsets.only(left: Dimensions.width10),
                child: Row(
                  children: [
                    Icon(Icons.remove, color: AppColors.signColor,),
                    SizedBox(width: Dimensions.width5,),
                    Text('0'),
                    SizedBox(width: Dimensions.width5,),
                    Icon(Icons.add, color: AppColors.signColor)
                  ],
                ),),
              Container(decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.all(Radius.circular(Dimensions.width20))),
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.width20, right: Dimensions.width20, left: Dimensions.width20),
                child: BigText(text: "\$10 | Add to cart", color: Colors.white,),
              )

            ],
          ),
      ),
    );
  }
}
