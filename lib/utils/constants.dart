import 'package:flutter/material.dart';

import 'hexcolor.dart';

final Color kPurpleColor = HexColor("#6908D6");

final TextStyle kPurpleBoldTextStyle = TextStyle(
  color: kPurpleColor,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

final BoxDecoration kMinusPlusButtonsBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(7.0),
  color: kPurpleColor.withOpacity(0.1),
);
