import 'package:demo_vehiclebook_app/Utils/dimensions.dart';
import 'package:flutter/material.dart';
class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double? size;
  double? height;
  TextOverflow? textOverFlow;

  BigText({required this.text,this.color=Colors.black,this.size=0,this.textOverFlow = TextOverflow.ellipsis,this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverFlow,
      // maxLines: 1,
      style: TextStyle(
        fontSize: size == 0 ? Dimensions.font24 :size,
        color: color,fontWeight: FontWeight.bold
      ),

    );
  }
}
