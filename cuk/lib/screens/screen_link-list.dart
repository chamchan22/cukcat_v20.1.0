//링크 스크린
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/pages/page_link-carousel.dart';
import 'package:cuk/pages/page_quick-slot.dart';
import 'package:cuk/widgets/widget_appbar.dart';
import 'package:cuk/widgets/widget_card-frame.dart';
import 'package:cuk/widgets/widget_circle-icon-avatar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LinkListScreen extends StatefulWidget {
  @override
  _LinkListScreenState createState() => _LinkListScreenState();
}

class _LinkListScreenState extends State<LinkListScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        type: "LinkListScreen",
        title: "링크 모아보기",
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: SizeConverterFunction(context: context, size: 40.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Color(0XFFD3D3D3),
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text(
                  "학교 생활에 필요한 링크를 한눈에 확인하세요!\n아이콘을 길게 눌러 Quick Slot 에 등록할 수 있습니다.",
                  style: TextStyle(
                    fontSize:
                        SizeConverterFunction(context: context, size: 13.0),
                    color: Color(0XFF909090),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: ListView(
              children: <Widget>[
                LinkCarouselPage(),
                Container(
                  height: MediaQuery.of(context).size.width * 0.4,
                  color: Color(0XFFF3F3F3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.settings,
                              color: Color(0XFF707070),
                              size: SizeConverterFunction(
                                context: context,
                                size: 17.0,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              "QuickSlot Setting",
                              style: TextStyle(
                                fontSize: SizeConverterFunction(
                                  context: context,
                                  size: 17.0,
                                ),
                                color: Color(0XFF707070),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      QuickSlotPage(isStackButtonRequire: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
