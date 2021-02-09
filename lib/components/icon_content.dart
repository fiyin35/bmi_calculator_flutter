import 'package:flutter/material.dart';
import '../constant.dart';

class IconContent extends StatelessWidget {
  final String cardText;
  final IconData cardIcon;

  IconContent({this.cardText, this.cardIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(cardText,
          style: kLabelTextStyle,)
      ],
    );
  }
}