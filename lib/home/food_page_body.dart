import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../widgets/icon_and_text_widget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  var _scaleFactor = 0.8;
  double _height =Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {setState(() {
      _currPageValue = pageController.page!;
      // print(_currPageValue.toString());
    });});
  }
  @override
  void dispose(){
    pageController.dispose();
  }
  Widget build(BuildContext context) {
    return Column(children: [Container(
      height: Dimensions.pageView,
      decoration: const BoxDecoration(),
      padding: const EdgeInsets.all(0),
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position){
            return _buildPageItem(position);
          }),), DotsIndicator(dotsCount: 5,position: _currPageValue, decorator: DotsDecorator (activeColor: AppColors.mainColor,size: const Size.square((9.0)), activeSize: const Size(18.0,9.0), activeShape:  RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(Dimensions.radius10), right: Radius.circular(Dimensions.radius10)))),)
    ],) ;
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()){
        var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,  0);
    }else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,  0);
    }
    else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      // print('$currScale index:$index _currPageValue:$_currPageValue');
      print('$currScale index:$index _currPageValue:$_currPageValue');
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,  0);
    }else {
      var currScale=0.8;
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,  0);
    }
    return Transform(transform: matrix, child:   Stack(children: [
      Container(height: Dimensions.pageViewContainer, margin: const EdgeInsets.all(5),decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius30),color: const Color(0xFF89DAD0),image: const DecorationImage(image: AssetImage("assets/images/food_1.jpg"), fit: BoxFit.fitWidth)),),
      Align(alignment: Alignment.bottomCenter,
        child: Container(height: Dimensions.pageViewTextContainer,margin: const EdgeInsets.only(right: 30, left: 30, bottom: 15),decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius30),color: const Color(0xFFFFFFFF),boxShadow: const [BoxShadow(color: Color(0xFFE8E8E8), blurRadius: 5.0, offset: Offset(0,5),), BoxShadow(color: Colors.white, blurRadius: 0, offset: Offset(5,0),), BoxShadow(color: Colors.white, blurRadius: 0, offset: Offset(-5,0),)]),
          child: Container(padding: const EdgeInsets.all(15.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,children: [
              BigText(text: "Desert",),
              SizedBox(height: Dimensions.height20),
              Row(children: [
                Wrap(children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor,size: 15,)),),
                SizedBox(width: Dimensions.width5,),
                SmallText(text: "4.5"),
                SizedBox(width: Dimensions.width10,),
                SmallText(text: "1278"),
                SizedBox(width: Dimensions.width5,),
                SmallText(text: "comments")
              ],),
              Row( children:  [const IconAndText(iconData: Icons.circle_sharp, text: "Normal", color: Colors.orangeAccent,),
                SizedBox(width: Dimensions.width15,),
                IconAndText(iconData: Icons.location_on, text: "1.7 km", color: Colors.blue,),
                SizedBox(width: Dimensions.width15,),
                IconAndText(iconData: Icons.lock_clock, text: "32 min", color: Colors.lightGreenAccent,),
              ],),


            ],),) ,)
        ,)


    ],) ,);
   }
}
