import 'package:cuk/widgets/widget_circle-icon-avatar.dart';
import 'package:cuk/widgets/widget_decorated-text.dart';
import 'package:flutter/material.dart';

class NewFeatureLinkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map _newFeatureList = {
      "title": "동아리 둘러보기",
      "definition": "가톨릭 대학교 성심교정의 동아리를 확인하세요!",
      "icon": Icons.bookmark,
      "isAvatarLeft": true,
      "color": Color(0XFFFFF596),
      "function": () => Navigator.pushNamed(
            context,
            "/feature/clubChannel",
          ),
    };

    return InkWell(
      onTap: _newFeatureList['function'],
      child: Container(
        height: MediaQuery.of(context).size.width * 0.301,
        color: Color(0XFFAAC4FF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 8,
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0XFF0956BC),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "CUKCAT",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: " 에서 제공하는",
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5.5),
                    Row(
                      children: <Widget>[
                        DecoratedTextWidget(
                          text: "새로운 기능",
                          textSize: 20.0,
                          textColor: Color(0XFF0956BC),
                          backgroundColor: Color(0XFFD5E2FF),
                          textWeight: FontWeight.w600,
                        ),
                        Text(
                          "을 만나보세요!",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0XFF0956BC),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(flex: 2),
            Flexible(
              flex: 3,
              child: FittedBox(
                child: CircleIconAvatarWidget(
                  size: MediaQuery.of(context).size.width * 0.157,
                  backgroundColor: _newFeatureList['color'],
                  isTitleRequire: true,
                  title: _newFeatureList['title'],
                  titleColor: Colors.white,
                  icon: _newFeatureList['icon'],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
