import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';
class ExpandableTextWidget extends StatefulWidget {

  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;
  double textHeight = Dimensions.screenHeight/5.5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }
    else{
      firstHalf=widget.text;
      secondHalf='';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf):Column(
        children: [
          Text(hiddenText?('$firstHalf...'):('$firstHalf $secondHalf')),
          InkWell(
            onTap: (){

            },
            child: Row(
              children: [
                    SmallText(text: 'Show more ', color: Colors.teal,),
                    const Icon(Icons.expand_more),
              ],
            ),
          )
        ],
      ),
    );
  }
}