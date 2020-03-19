import 'package:cuk/functions/function_draw-horizontal-line.dart';
import 'package:cuk/widgets/widget_horizontal-line.dart';
import 'package:flutter/material.dart';

Container TitleHeadLineWidget({
  @required String title,
  Color titleColor = Colors.grey,
  double textSize = 18.0,
}) {
  return Container(
    padding: EdgeInsets.only(left: 20.0, right: 10.0),
    child: Row(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: textSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 10.0),
        //CustomPaint(painter: DrawHorizontalLineFunction()),
        //커스텀 페인터 사용 안하고 밑에꺼 쓰는게 더 이득이라서 이거 사용합니다.
        HorizontalLineWidget(),
      ],
    ),
  );
}
