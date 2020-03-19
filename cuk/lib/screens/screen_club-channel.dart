import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuk/functions/function_alert-dialog.dart';
import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/pages/page_alert-dialog.dart';
import 'package:cuk/providers/provider_club-search-option.dart';
import 'package:cuk/widgets/widget_decorated-text.dart';
import 'package:cuk/widgets/widget_flat-button.dart';
import 'package:cuk/widgets/widget_horizontal-line.dart';
import 'package:cuk/widgets/widget_title-headline.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClubChannelScreen extends StatefulWidget {
  @override
  _ClubChannelScreenState createState() => _ClubChannelScreenState();
}

class _ClubChannelScreenState extends State<ClubChannelScreen> {
  ClubSearchOption _clubSearchOption;
  SharedPreferences prefs;

  //2019 && 2020 동아리 정보 저장(Map 형태) 리스트
  List<Map> DongAriList = List<Map>();
  List<Map> DongAriList2020 = List<Map>();

  //2019 && 2020 동아리 정보 저장 리스트
  List imageList;
  List clubNameList;
  List imageList2020;
  List clubNameList2020;

  String schoolValue = "1";
  String yearValue = "1";

  @override
  void initState() {
    // TODO: implement initState
    InitPrefs();
    super.initState();
  }

  String clubName = '';
  String imgUrl = '';
  List<String> ClubImageUrlList = List<String>();
  List<String> ClubNameList = List<String>();

  Future getClubImage() async {
    ClubImageUrlList = [];
    ClubNameList = [];
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("club")
        .document("2020")
        .collection("songsim")
        .getDocuments();
    querySnapshot.documents.forEach((doc) async {
      clubName = jsonEncode(doc['club-name']);
      imgUrl = jsonEncode(doc['image-url']);
      clubName = clubName.substring(0, clubName.length - 1);
      clubName = clubName.substring(1);

      imgUrl = imgUrl.substring(0, imgUrl.length - 1);
      imgUrl = imgUrl.substring(1);

      ClubNameList.add(clubName);
      ClubImageUrlList.add(imgUrl);
    });
    prefs.setStringList("dongari-imageurl-2020", ClubImageUrlList);
    prefs.setStringList("dongari-clubname-2020", ClubNameList);

    DongAriList2020 = [];

    imageList2020 = prefs.getStringList("dongari-imageurl-2020");
    clubNameList2020 = prefs.getStringList("dongari-clubname-2020");
    for (int i = 0; i < imageList2020.length; i++) {
      setState(() {
        DongAriList2020.add({
          "club-name": clubNameList2020[i],
          "image-url": imageList2020[i],
        });
      });
    }
    print(DongAriList2020);
  }

  InitPrefs() async {
    print("initPrefs");
    prefs = await SharedPreferences.getInstance(); //prefs에 내부 저장소를 가져오게 지정한다.

    imageList = prefs.getStringList("dongari-imageurl");
    clubNameList = prefs.getStringList("dongari-clubname");
    imageList2020 = prefs.getStringList("dongari-imageurl-2020");
    clubNameList2020 = prefs.getStringList("dongari-clubname-2020");
    for (int i = 0; i < imageList.length; i++) {
      setState(() {
        DongAriList.add({
          "club-name": clubNameList[i],
          "image-url": imageList[i],
        });
      });
    }
    for (int i = 0; i < imageList2020.length; i++) {
      setState(() {
        DongAriList2020.add({
          "club-name": clubNameList2020[i],
          "image-url": imageList2020[i],
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _clubSearchOption = Provider.of<ClubSearchOption>(context);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          TitleHeadLineWidget(
            title: "동아리 포스터",
            textSize: SizeConverterFunction(
              context: context,
              size: 20.0,
            ),
            titleColor: Color(0XFF9F5EB6),
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              DecoratedTextWidget(
                text: _clubSearchOption.getValueYear(),
                textSize: SizeConverterFunction(
                  context: context,
                  size: 15.0,
                ),
                textColor: Colors.white,
                backgroundColor: Color(0XFFB2BFFF),
                borderRadius: 5.0,
                paddingLeft: SizeConverterFunction(
                  context: context,
                  size: 6.0,
                ),
                paddingRight: SizeConverterFunction(
                  context: context,
                  size: 6.0,
                ),
                paddingTop: SizeConverterFunction(
                  context: context,
                  size: 6.0,
                ),
                paddingBottom: SizeConverterFunction(
                  context: context,
                  size: 6.0,
                ),
                textWeight: FontWeight.w600,
              ),
              SizedBox(width: 10.0),
              DecoratedTextWidget(
                text: _clubSearchOption.getValueSchool(),
                textSize: SizeConverterFunction(
                  context: context,
                  size: 15.0,
                ),
                textColor: Colors.white,
                backgroundColor: Color(0XFFB2BFFF),
                borderRadius: 5.0,
                paddingLeft: SizeConverterFunction(
                  context: context,
                  size: 6.0,
                ),
                paddingRight: SizeConverterFunction(
                  context: context,
                  size: 6.0,
                ),
                paddingTop: SizeConverterFunction(
                  context: context,
                  size: 6.0,
                ),
                paddingBottom: SizeConverterFunction(
                  context: context,
                  size: 6.0,
                ),
                textWeight: FontWeight.w600,
              ),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialogPage();
                    }),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0XFFB2BFFF),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      SizeConverterFunction(
                        context: context,
                        size: 6.0,
                      ),
                    ),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: SizeConverterFunction(
                        context: context,
                        size: 16.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            height: SizeConverterFunction(
              context: context,
              size: 450.0,
            ),
            child: CarouselSlider(
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              height: SizeConverterFunction(
                context: context,
                size: 450.0,
              ),
              items: (_clubSearchOption.getIsValueYear2020()
                      ? DongAriList2020
                      : DongAriList)
                  .map((element) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width:
                          SizeConverterFunction(context: context, size: 224.0),
                      height:
                          SizeConverterFunction(context: context, size: 360.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                element["club-name"],
                                style: TextStyle(
                                  color: Color(0XFF767676),
                                  fontSize: SizeConverterFunction(
                                    context: context,
                                    size: 15.0,
                                  ),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "구독하기",
                                    style: TextStyle(
                                      color: Color(0XFFF8ADAD),
                                      fontSize: SizeConverterFunction(
                                        context: context,
                                        size: 10.0,
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "이동하기",
                                    style: TextStyle(
                                      color: Color(0XFFFDC9FF2),
                                      fontSize: SizeConverterFunction(
                                        context: context,
                                        size: 10.0,
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ExtendedImage.network(
                            element["image-url"] ??
                                'https://firebasestorage.googleapis.com/v0/b/cukcat-40d1d.appspot.com/o/2020%2Fverybad.png?alt=media&token=https://firebasestorage.googleapis.com/v0/b/cukcat-40d1d.appspot.com/o/2020%2Fverybad.png?alt=media&token=036f3bfc-7c4b-4ddc-a244-457f5d646113',
                            width: SizeConverterFunction(
                                context: context, size: 224.0),
                            height: SizeConverterFunction(
                                context: context, size: 351.0),
                            fit: BoxFit.contain,
                            cache: true,
                            border: Border.all(width: 1.0, color: Colors.white),
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            //cancelToken: cancellationToken,
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10.0),
          TitleHeadLineWidget(
            title: "분과별 동아리",
            textSize: SizeConverterFunction(
              context: context,
              size: 20.0,
            ),
            titleColor: Color(0XFF718800),
          ),
          InkWell(
            onTap: () => getClubImage(),
            child: FlatButtonWidget(
                flatButtonHeight: 50, flatButtonWidth: 300, title: "공예분과"),
          ),
        ],
      ),
    );
  }
}
