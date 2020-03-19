import 'package:flutter/material.dart';

Container CircleIconAvatarWidget({
  @required double size,
  @required Color backgroundColor,
  @required bool isTitleRequire,
  double borderWidth = 0.0,
  Color borderColor = Colors.white,
  bool isStackButtonRequire = false,
  IconData icon = Icons.airplanemode_inactive,
  Color iconColor = Colors.white,
  String title = 'Error',
  Color titleColor,
  IconData stackButtonIcon,
  var onTapFunction,
  var opLongPressFunction,
  var onTapStackButtonFunction,
  double paddingTop = 0,
  double paddingBottom = 0,
  double paddingLeft = 0,
  double paddingRight = 0,
  double stackButtonPositionTop,
  double stackButtonPositionBottom,
  double stackButtonPositionLeft,
  double stackButtonPositionRight,
}) {
  final List<double> _padding = [
    paddingTop,
    paddingBottom,
    paddingLeft,
    paddingRight
  ];
  final List<double> _stackButtonPosition = [
    stackButtonPositionTop,
    stackButtonPositionBottom,
    stackButtonPositionLeft,
    stackButtonPositionRight,
  ];
  return Container(
    child: Stack(
      children: <Widget>[
        InkWell(
          onTap: onTapFunction ?? null,
          onLongPress: opLongPressFunction ?? null,
          child: Padding(
            padding: EdgeInsets.only(
              top: _padding[0],
              bottom: _padding[1],
              left: _padding[2],
              right: _padding[3],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: size,
                  height: size,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: backgroundColor,
                      border: Border.all(width: borderWidth,color: borderColor)

                    ),
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: size * 0.63,
                    ),
                  ),
                ),
                Visibility(
                  visible: isTitleRequire,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: titleColor ?? Color(0XFF707070),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: isStackButtonRequire,
          child: Positioned(
            top: _stackButtonPosition[0] ?? null,
            bottom: _stackButtonPosition[1] ?? null,
            left: _stackButtonPosition[2] ?? null,
            right: _stackButtonPosition[3] ?? null,
            child: InkWell(
              onTap: onTapStackButtonFunction ?? null,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    stackButtonIcon,
                    size: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
