import 'package:demo_vehiclebook_app/Utils/dimensions.dart';
import 'package:flutter/material.dart';
class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double? size;
  double? height;
  TextOverflow? textOverFlow;

  SmallText({required this.text,this.color=Colors.black,this.size=0,this.textOverFlow = TextOverflow.ellipsis,this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
     // overflow: textOverFlow,
     // maxLines: 1,
      style: TextStyle(
          color: color,
        fontSize: size == 0 ? Dimensions.font14 :size

      ),

    );
  }
}
