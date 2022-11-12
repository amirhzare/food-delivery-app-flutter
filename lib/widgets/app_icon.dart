import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final Color iconColor;
  final double iconSize;
  final double size;
  const AppIcon({Key? key, required this.iconData, this.iconSize=25, this.size=40, this.color=const Color(
      0xFFFFFFFF), required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center,width: size, height: size,
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(size)),child: Icon(iconData,color: this.iconColor,),);
  }
}
