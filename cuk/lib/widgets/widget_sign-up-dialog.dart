import 'package:flutter/material.dart';

AlertDialog SignUpDialogWidget({
  @required BuildContext context,
  @required Widget userNickName,
  @required double contentHeight,
  @required double contentWidget,
  var lauchFunction,
}) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(width: 32.0),
        Text(
          "회원 가입 알림!!",
          style: TextStyle(
            fontFamily: "NanumSquareExtraBold",
            fontSize: 20.0,
            color: Color(0XFF738AFF),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Text(
            "닫기",
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0XFF006DFF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
    content: SizedBox(
      height: contentHeight,
      width: contentWidget,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "    당신의 닉네임은",
                style: TextStyle(
                  color: Color(0XFF597194),
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            userNickName,
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "입니다./(^ * ^)/    ",
                style: TextStyle(
                  color: Color(0XFF597194),
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            InkWell(
              onTap: () => lauchFunction,
              child: Text("런치"),
            )
          ],
        ),
      ),
    ),
  );
}
