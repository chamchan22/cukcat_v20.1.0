import 'package:flutter/material.dart';
/*
<rule>
모든 카드 위젯은 CardFramWidget 으로 감싼다.
cardFrameWidget 의 child 에 해당 위젯안에 들어갈 요소를 코딩한다.
 */

InkWell CardFrameWidget({
  @required Widget child,
  @required double cardWidth,
  @required double cardHeight,
  double paddingTop = 0,
  double paddingBottom = 0,
  double paddingLeft = 0,
  double paddingRight = 0,
  double marginTop = 0,
  double marginBottom = 0,
  double marginLeft = 0,
  double marginRight = 0,
  double boxSpreadRadius = 1.0,
  double blurRadius = 6.0,
  double borderRadius = 10.0,
  var onTapFunction,
}) {
  //padding or margin = [상, 하, 좌, 우];
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

  return InkWell(
    onTap: onTapFunction ?? null,
    child: Container(
      width: cardWidth,
      height: cardHeight,
      margin: EdgeInsets.only(
        top: margin[0],
        bottom: margin[1],
        left: margin[2],
        right: margin[3],
      ),
      padding: EdgeInsets.only(
        top: padding[0],
        bottom: padding[1],
        left: padding[2],
        right: padding[3],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            spreadRadius: boxSpreadRadius,
            blurRadius: blurRadius,
            color: Colors.grey[300],
          ),
        ],
      ),
      child: child,
    ),
  );
}
