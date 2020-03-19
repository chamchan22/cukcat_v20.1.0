import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/pages/page_team-intro.dart';
import 'package:cuk/widgets/widget_card-frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  licensePage() {
    return ListView(
      children: <Widget>[
        CardFrameWidget(
          child: Center(
            child: Text(
              '''
          BSD : 
          
              firebase_auth : Publisher : flutter.dev
              url_launcher
              shared_preferences : Publisher : flutter.dev
              cloud_firestore : Publisher : flutter.dev
              intl : Publisher : dart.dev
              firebase_storage : Publisher : flutter.dev
              

          Apache 2.0 :
          
              Hive : Publisher hivedb.dev
              table_calendar
              simple_gesture_detector
              

          MIT License :
          
              provider : Publisher : dash-overflow.net
              extended_image : Publisher : fluttercandies.com
              carousel_slider : carousel_slider
              logger
              ''',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0XFF8B8B8B),
              ),
            ),
          ),
          cardWidth: SizeConverterFunction(context: context, size: 340.0),
          cardHeight: SizeConverterFunction(context: context, size: 380.0),
          marginTop: SizeConverterFunction(context: context, size: 15.0),
          marginRight: SizeConverterFunction(context: context, size: 18.0),
          marginLeft: SizeConverterFunction(context: context, size: 18.0),
        ),
      ],
    );
  }

  advertisePage() {
    return ListView(
      children: <Widget>[
        CardFrameWidget(
          paddingLeft: 20.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "모든 광고 및 어플에 대한 문의는",
                style: TextStyle(
                  fontSize: SizeConverterFunction(context: context, size: 14.0),
                  color: Color(0XFF8B8B8B),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "qortkdn@naver.com",
                    style: TextStyle(
                        fontSize:
                            SizeConverterFunction(context: context, size: 20.0),
                        color: Color(0XFF738AFF),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    " 으로 문의 주세요!",
                    style: TextStyle(
                      fontSize:
                          SizeConverterFunction(context: context, size: 14.0),
                      color: Color(0XFF8B8B8B),
                    ),
                  ),
                ],
              ),
            ],
          ),
          cardWidth: 100,
          cardHeight: SizeConverterFunction(context: context, size: 100.0),
          marginTop: SizeConverterFunction(context: context, size: 15.0),
          marginRight: SizeConverterFunction(context: context, size: 18.0),
          marginLeft: SizeConverterFunction(context: context, size: 18.0),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    String _viewType = ModalRoute.of(context).settings.arguments;
    var viewPort;
    if(_viewType == "license"){
      viewPort = licensePage();
    }else if(_viewType == "advertise"){
      viewPort = advertisePage();
    }else{
      viewPort = TeamIntroPage();
    }

    return Scaffold(
      appBar: AppBar(),
      body: viewPort,
    );
  }
}
