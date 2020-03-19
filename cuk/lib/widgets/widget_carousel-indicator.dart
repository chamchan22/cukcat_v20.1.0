import 'package:flutter/material.dart';

Container CarouselIndicatorWidget({
  @required int currentIndex,
  @required double width,
}) {
  List<String> _indicatorList = ["메인", "학사", "도서관", "기숙사"];
  return Container(
    width: width,
    margin: EdgeInsets.only(left: 25.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
        _indicatorList.length,
        (i) => Text(
          _indicatorList[i],
          style: TextStyle(
            fontSize: i == currentIndex ? 25.0 : 15.0,
            color: i == currentIndex ? Color(0XFF1F1A94) : Color(0XFF9594AC),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

/*
Container(
    child: Row(
      children: List.generate(
        _indicatorList.length,
        (i) => Text(
          _indicatorList[i],
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    ),
  );
 */
