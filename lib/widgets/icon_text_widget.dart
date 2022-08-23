import 'package:flutter/material.dart';
class IconAndTextWidget extends StatelessWidget {
  final String text;
  final IconData icon;
 // final Color color;
  final Color iconcolor;

   IconAndTextWidget({Key? key,
    // required this.color,
     required this.text,
     required this.icon,
     required this.iconcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconcolor,),
        SizedBox(width: 5,),
        Text(text,style: TextStyle(
          //color: color
        ),)
      ],
    );
  }
}
