import 'package:flutter/material.dart';

DecoratedBox DecoratedTextWidget({
  @required String text,
  @required double textSize,
  @required Color textColor,
  Color backgroundColor = Colors.grey,
  double borderRadius = 5.0,
  FontWeight textWeight = FontWeight.normal,
  double paddingTop = 1.5,
  double paddingBottom = 1.5,
  double paddingLeft = 1.5,
  double paddingRight = 1.5,
  String textFamily = "NanumSquareRegular",
  double marginTop = 0,
  double marginBottom = 0,
  double marginLeft = 0,
  double marginRight = 0,
}) {
  final List<double> padding = [
    paddingTop,
    paddingBottom,
    paddingLeft,
    paddingRight
  ];
  final List<double> margin = [
    marginTop,
    marginBottom,
    marginLeft,
    marginRight
  ];
  return DecoratedBox(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    ),
    child: Padding(
      padding: EdgeInsets.only(
        top: padding[0],
        bottom: padding[1],
        left: padding[2],
        right: padding[3],
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: margin[0],
          bottom: margin[1],
          left: margin[2],
          right: margin[3],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            color: textColor,
            fontWeight: textWeight,
            fontFamily: textFamily,
          ),
        ),
      ),
    ),
  );
}
