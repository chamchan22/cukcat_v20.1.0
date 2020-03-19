import 'package:flutter/material.dart';

Container FeatureElementWidget({
  @required Widget circleIconAvatar,
  @required bool isAvatarLeft,
  @required String title,
  @required String definition,
}) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Visibility(
          visible: isAvatarLeft,
          child: Flexible(
            flex: 3,
            child: FittedBox(child: circleIconAvatar),
          ),
        ),
        Visibility(
          visible: isAvatarLeft,
          child: Spacer(
            flex: 1,
          ),
        ),
        Flexible(
          flex: 10,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF747474),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  definition,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color(0XFF969696),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: !isAvatarLeft,
          child: Spacer(
            flex: 2,
          ),
        ),
        Visibility(
          visible: !isAvatarLeft,
          child: Flexible(
            flex: 3,
            child: FittedBox(child: circleIconAvatar),
          ),
        ),
      ],
    ),
  );
}
