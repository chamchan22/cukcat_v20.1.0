import 'package:flutter/material.dart';

Visibility CurtainWidget({
  @required double curtainWidth,
  @required double curtainHeight,
  @required bool isCurtainVisible,
}) {
  return Visibility(
    visible: isCurtainVisible ?? false,
    child: Opacity(
      opacity: 0.5,
      child: Container(
        height: curtainHeight,
        width: curtainWidth,
        color: Colors.black,
        child: Center(
          child: Text(
            "로그인 후 사용가능합니다.",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
