import 'package:cuk/widgets/widget_horizontal-line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container NoticeItemWidget({
  @required double noticeItemHeight,
  @required Widget circleIconAvatarWidget,
  @required double noticeTypeTextSize,
  @required double noticeCreatedTimeTextSize,
  @required double noticeTitleTextSize,
  @required double centerPadding,
  @required String noticeType,
  @required String noticeCreatedTime,
  @required String noticeTitle,
}) {
  return Container(
    height: noticeItemHeight,
    margin: EdgeInsets.only(bottom: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        circleIconAvatarWidget,
        SizedBox(width: centerPadding),
        Container(
          width: noticeItemHeight * 3.92,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: noticeType,
                      style: TextStyle(
                        fontSize: noticeTitleTextSize,
                        color: Color(0XFF334856),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: "  "),
                    TextSpan(
                      text: noticeCreatedTime,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Color(0XFF798186),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              HorizontalLineWidget(lineColor: Color(0XFFD6D6D6)),
              Container(
                height: noticeItemHeight * 0.53,
                width: noticeItemHeight * 3.92,
                child: Text(
                  noticeTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: noticeTitleTextSize,
                    color: Color(0XFF51636F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
