import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import '../../widgets/icon_and_text_widget.dart';

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
          }),), DotsIndicator(dotsCount: 5,position: _currPageValue, decorator: DotsDecorator (activeColor: AppColors.mainColor,size: const Size.square((9.0)), activeSize: const Size(18.0,9.0), activeShape:  RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(Dimensions.radius10), right: Radius.circular(Dimensions.radius10)))),),
        SizedBox(width: Dimensions.height10,),
        Container(margin: EdgeInsets.all(Dimensions.width30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            BigText(text: "Popular"),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "Food Pairing")
          ],),),
    //  list of food
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index){
            return Container(
                margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height10),
                child: Row(
                  children: [
                    Container(width: Dimensions.listViewImgSize,height: Dimensions.listViewImgSize,decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),color: Colors.white38,image: const DecorationImage(image: AssetImage('assets/images/food_0.jpg') , fit: BoxFit.fitWidth)),),
                    Expanded(child: Container(height: Dimensions.listViewTextContainerSize, decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20), bottomRight: Radius.circular(Dimensions.radius20)),color: Colors.white),
                      child: Padding(padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          BigText(text: "Nutritious fruit meal in china"),
                            SizedBox(height: Dimensions.height10,),
                          SmallText(text: "Whit chinese characteristics"),
                          SizedBox(height: Dimensions.height15,),
                          Row( children:  [const IconAndText(iconData: Icons.circle_sharp, text: "Normal", color: Colors.orangeAccent,),
                            SizedBox(width: Dimensions.width5,),
                            IconAndText(iconData: Icons.location_on, text: "1.7 km", color: Colors.blue,),
                            SizedBox(width: Dimensions.width5,),
                            IconAndText(iconData: Icons.lock_clock, text: "32 min", color: Colors.lightGreenAccent,),
                          ],)
                        ],),
                      ),
                    ),

                    )],
                )
            );
          })

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
    return Transform(transform: matrix, child: Stack(children: [
      Container(height: Dimensions.pageViewContainer, margin: const EdgeInsets.all(5),decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius30),color: const Color(0xFF89DAD0),image: const DecorationImage(image: AssetImage("assets/images/food_1.jpg"), fit: BoxFit.fitWidth)),),
      Align(alignment: Alignment.bottomCenter,
        child: Container(height: Dimensions.pageViewTextContainer,margin: const EdgeInsets.only(right: 30, left: 30, bottom: 15),decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius30),color: const Color(0xFFFFFFFF),boxShadow: const [BoxShadow(color: Color(0xFFE8E8E8), blurRadius: 5.0, offset: Offset(0,5),), BoxShadow(color: Colors.white, blurRadius: 0, offset: Offset(5,0),), BoxShadow(color: Colors.white, blurRadius: 0, offset: Offset(-5,0),)]),
          child: Container(padding: const EdgeInsets.all(15.0),
            child: const AppColumn(text:'new'),) ,)
        ,)


    ],) ,);
   }
}
