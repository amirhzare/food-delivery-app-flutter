import 'package:flutter/cupertino.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      BigText(text: text,),
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


    ],);
  }
}
