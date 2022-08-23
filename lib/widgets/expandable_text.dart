import 'package:demo_vehiclebook_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../Utils/dimensions.dart';
class ExpandedText extends StatefulWidget {
  final String text;
  const ExpandedText({Key? key,required this.text}) : super(key: key);

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {

   late String firsthalf;
   late String secondhalf;

   bool hiddentext = true;

   double textHeight = 50;
       // Dimensions.screenHeight/3.4;

   @override
   void initState(){
     super.initState();
     if(widget.text.length>textHeight){
       firsthalf = widget.text.substring(0,textHeight.toInt());
       secondhalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
     }else{
       firsthalf = widget.text;
       secondhalf = "";
     }
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondhalf.isEmpty? SmallText(text: firsthalf) :Column(
        children: [
          SmallText( height :2.8,text: hiddentext?(firsthalf+ '...'):(firsthalf+secondhalf)),
       InkWell(
         onTap: (){
  setState((){
    hiddentext = !hiddentext;
  });
         },
         child: Row(
           children: [
             SmallText(text: hiddentext?'Show More':'Show Less'),
             Icon(hiddentext?Icons.arrow_drop_down:Icons.arrow_drop_up)
           ],
         ),
       )
        ],
      ),
    );
  }
}
