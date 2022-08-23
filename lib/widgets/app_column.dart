import 'package:demo_vehiclebook_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../Utils/dimensions.dart';
import 'big_text.dart';
import 'icon_text_widget.dart';
class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font14,),
        SizedBox(height: Dimensions.sizedHeight10),
        Row(
          children: [
            Wrap(
              children:
              List.generate(5, (index) => Icon(Icons.star,
                color: Colors.blue,size: Dimensions.iconsize20,)),

            ),
            SizedBox(width: Dimensions.sizedWidth10),
            SmallText(text: '4.5'),
            SizedBox(width: Dimensions.sizedWidth10),
            SmallText(text: '1234'),
            SizedBox(width: Dimensions.sizedWidth10),
            SmallText(text: 'Comments'),

          ],
        ),
        SizedBox(height: Dimensions.sizedHeight10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              iconcolor: Colors.yellow,
              text: 'Normal',
            ),
            IconAndTextWidget(
              icon: Icons.location_on,
              iconcolor: Colors.green,
              text: '1.7km',
            ),
            IconAndTextWidget(
              icon: Icons.access_time_rounded,
              iconcolor: Colors.orange,
              text: '32min.',
            )
          ],
        )
      ],
    );
  }
}
