import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

import '../../utils/dimensions.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               AppIcon(iconData: Icons.clear, iconColor: Colors.grey,),
               AppIcon(iconData: Icons.shopping_cart_outlined, iconColor: Colors.grey,)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20), topLeft: Radius.circular(Dimensions.radius20))),
                child: BigText(text:'Sliver App Bar'),) ,

            ),
            pinned: true,
            expandedHeight: 300,
            backgroundColor:AppColors.iconColor1,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/food_0.jpg",
              width: double.maxFinite,
              fit: BoxFit.cover,
              ),

            ),
          ),
          SliverToBoxAdapter(
           child: Column(children: [
             Container(
               padding: EdgeInsets.only(left: Dimensions.radius10, right: Dimensions.radius10, top: Dimensions.radius5, bottom: Dimensions.radius5),
               child: ExpandableTextWidget(text:
           'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains. On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains. On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.'
           ),)
           ]),)
        ]

      ),
      bottomNavigationBar:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: Dimensions.width20*2.5, right: Dimensions.width20*2.5, top: Dimensions.height10, bottom: Dimensions.height10),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(iconData: Icons.remove, iconColor: AppColors.white, color: AppColors.mainColor),
                BigText(text: "12.88 ${'X'} ${'0'}", color: AppColors.mainBlackColor,),
                AppIcon(iconData: Icons.add, iconColor: AppColors.white, color: AppColors.mainColor,)
              ],),
          ),
          Container(height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.width20, right: Dimensions.width20),
            decoration: BoxDecoration(color: AppColors.lightGray, borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20*2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20), color: Colors.white),
                  padding:  EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.width20, right: Dimensions.width20, left: Dimensions.width20),
                  margin: EdgeInsets.only(left: Dimensions.width10),
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: AppColors.mainColor,),
                    ],
                  ),),
                Container(decoration: BoxDecoration(color: AppColors.mainColor, borderRadius: BorderRadius.all(Radius.circular(Dimensions.width20))),
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.width20, right: Dimensions.width20, left: Dimensions.width20),
                  child: BigText(text: "\$10 | Add to cart", color: Colors.white,),
                )

              ],
            ),
          ),
      ],),
    );
  }
}
