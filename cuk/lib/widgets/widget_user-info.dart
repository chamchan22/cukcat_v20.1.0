import 'package:cuk/functions/function_size-converter.dart';
import 'package:flutter/material.dart';

Row UserInfoWidget({
  @required Widget userAvatarWidget,
  @required double userInfoHeight,
  @required String userName,
  @required String userEmail,
  @required bool isSignIn,
  BuildContext context,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      SizedBox(width: SizeConverterFunction(context: context, size: 20.0)),
      FittedBox(child: userAvatarWidget),
      SizedBox(width: SizeConverterFunction(context: context, size: 20.0)),
      Flexible(
        flex: 1,
        child: Container(
          height: userInfoHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: SizeConverterFunction(context: context, size: 18.0),
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(width: SizeConverterFunction(context: context, size: 10.0)),
                      Icon(
                        isSignIn ? Icons.check_circle : Icons.not_interested,
                        size: SizeConverterFunction(context: context, size: 14.0),
                        color: Color(0XFFFFFDCD),
                      ),
                      Text(
                        isSignIn ? " 인증완료" : " 인증이 필요해요",
                        style: TextStyle(
                          fontSize: SizeConverterFunction(context: context, size: 12.0),
                          color: Color(0XFFFFFDCD),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    userEmail,
                    style: TextStyle(
                      fontSize: SizeConverterFunction(context: context, size: 12.0),
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
//              SizedBox(width: 30.0),
              Visibility(
                visible: !isSignIn,
                child: Icon(
                  Icons.phonelink_setup,
                  color: Colors.white,
                  size: SizeConverterFunction(context: context, size: 25.0),
                ),
              ),
              SizedBox(width: 7.0),
            ],
          ),
        ),
      )
    ],
  );
}
