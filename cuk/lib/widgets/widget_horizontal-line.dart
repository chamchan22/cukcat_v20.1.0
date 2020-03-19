import 'package:flutter/material.dart';

Flexible HorizontalLineWidget({
  Color lineColor,
  double lineHeight = 1.0,
}) {
  return Flexible(
    flex: 1,
    child: Container(
      height: lineHeight,
      color: lineColor ?? Color(0XFFE6E6E6),
    ),
  );
}
