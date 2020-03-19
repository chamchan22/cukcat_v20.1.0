import 'package:flutter/material.dart';

InkWell BusFlatButtonWidget({
  @required double busFlatButtonSize,
  @required Color busFlatButtonColor,
  @required IconData busFlatButtonIcon,
  @required String busFlatButtonTitle,
  @required var busFlatButtonFunction,
}) {
  return InkWell(
    onTap: busFlatButtonFunction,
    child: Container(
      width: busFlatButtonSize,
      height: busFlatButtonSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 8.0,
          color: busFlatButtonColor,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            busFlatButtonIcon,
            size: busFlatButtonSize * 0.6,
            color: busFlatButtonColor,
          ),
          Text(
            busFlatButtonTitle,
            style: TextStyle(
              fontSize: busFlatButtonSize * 0.13,
              color: busFlatButtonColor,
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    ),
  );
}
