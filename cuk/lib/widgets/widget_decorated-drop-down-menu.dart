import 'package:flutter/material.dart';

Container DecoratedDropDownMenuWidget({
  @required var dropBoxButtonWidget,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0XFFF2F2F2),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    padding: EdgeInsets.only(left: 10.0, right: 10.0),
    child: Center(
      child: dropBoxButtonWidget,
    ),
  );
}
