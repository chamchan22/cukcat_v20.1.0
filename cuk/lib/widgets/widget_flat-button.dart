import 'package:flutter/material.dart';

Container FlatButtonWidget({
  @required double flatButtonHeight,
  @required double flatButtonWidth,
  @required String title,
}){
  return Container(
    decoration: BoxDecoration(
      color: Color(0XFF738AFF),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    width: flatButtonWidth,
    height: flatButtonHeight,
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}