import 'package:flutter/material.dart';

AppBar AppBarWidget({
  @required String type,
  String title = "CukCat",
  double elevation,
  var signFormBackFunction,
  var setSignFormChangeFunction,
  bool getIsSignInForm,
}) {
  switch (type) {
    case "HomeScreen":
    case "LinkListScreen":
      return AppBar(
        elevation: elevation ?? null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 23.0,
              ),
            ),
          ],
        ),
      );
//    case "LinkListScreen":
//      return AppBar(
//        elevation: elevation ?? null,
//        title: Container(
//          color: Colors.blue,
//          height: 100,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              Text(
//                title,
//                style: TextStyle(
//                  fontSize: 23.0,
//                ),
//              ),
//              Container(
//                color: Colors.amber,
//                height: 40,
//                child: Text(
//                  "학교 생활에 필요한 링크를 한눈에 확인하세요!\n아이콘을 길게 눌러 Quick Slot 에 등록할 수 있습니다.",
//                  style: TextStyle(
//                    fontSize: 13.0,
//                    color: Color(0XFF909090),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      );
    case "SignFormScreen":
      return AppBar(
        elevation: elevation ?? null,
        leading: InkWell(
          onTap: signFormBackFunction,
          child: Icon(Icons.close),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text(
                getIsSignInForm ? "로그인" : "회원가입",
                style: TextStyle(
                  color: Color(0XFF4179EC),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: setSignFormChangeFunction,
                child: Icon(
                  Icons.supervised_user_circle,
                ),
              ),
              SizedBox(width: 10.0),
            ],
          )
        ],
      );
    default:
      return AppBar();
  }
}
