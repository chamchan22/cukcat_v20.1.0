import 'package:cuk/functions/function_launch-url.dart';
import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/widgets/widget_bus-flat-button.dart';
import 'package:cuk/widgets/widget_card-frame.dart';
import 'package:cuk/widgets/widget_flat-button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BusInfoScreen extends StatefulWidget {
  @override
  _BusInfoScreenState createState() => _BusInfoScreenState();
}

class _BusInfoScreenState extends State<BusInfoScreen> {
  List<String> busLink = [
    "http://m.gbis.go.kr/search/StationArrivalViaList.do?stationId=210000416&districtCd=2&mobileNo=11406&mobileNoSi=&regionName=%EB%B6%80%EC%B2%9C&stationName=%EC%97%AD%EA%B3%A1%EC%97%AD%EB%B6%81%EB%B6%80&x=126.8116&y=37.4856167&osInfoType=M",
    "http://m.gbis.go.kr/search/StationArrivalViaList.do?stationId=210000422&districtCd=2&mobileNo=11426&mobileNoSi=&regionName=%EB%B6%80%EC%B2%9C&stationName=%EA%B0%80%ED%86%A8%EB%A6%AD%EB%8C%80%ED%95%99%EA%B5%90%EC%A0%95%EB%AC%B8&x=126.8048667&y=37.4855667&osInfoType=M",
    "http://m.gbis.go.kr/search/StationMap.do?stationId=210000416&mapTitle=%EC%97%AD%EA%B3%A1%EC%97%AD%EB%B6%81%EB%B6%80&districtCd=2&mobileNo=11406&mobileNoSi=&regionName=%EB%B6%80%EC%B2%9C&x=126.8116&y=37.4856167&osInfoType=M",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          CardFrameWidget(
            cardWidth: SizeConverterFunction(context: context, size: 337.0),
            cardHeight: SizeConverterFunction(context: context, size: 241.0),
            marginLeft: SizeConverterFunction(context: context, size: 20.0),
            marginRight: SizeConverterFunction(context: context, size: 20.0),
            marginTop: SizeConverterFunction(context: context, size: 20.0),
            marginBottom: SizeConverterFunction(context: context, size: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "성심교정 버스정보",
                      style: TextStyle(
                        fontSize:
                            SizeConverterFunction(context: context, size: 20.0),
                        color: Color(0XFF005EEC),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    BusFlatButtonWidget(
                      busFlatButtonSize:
                          SizeConverterFunction(context: context, size: 100.0),
                      busFlatButtonColor: Color(0XFF5D7BBE),
                      busFlatButtonIcon: Icons.directions_bus,
                      busFlatButtonTitle: "역곡역 → 학교",
                      busFlatButtonFunction: () => _launchURL(busLink[0]),
                    ),
                    BusFlatButtonWidget(
                      busFlatButtonSize:
                          SizeConverterFunction(context: context, size: 100.0),
                      busFlatButtonColor: Color(0XFF1AC7C3),
                      busFlatButtonIcon: Icons.directions_bus,
                      busFlatButtonTitle: "학교 → 역곡역",
                      busFlatButtonFunction: () => _launchURL(busLink[1]),
                    ),
                  ],
                ),
                InkWell(
                  child: FlatButtonWidget(
                    flatButtonHeight: SizeConverterFunction(
                      context: context,
                      size: 42.0,
                    ),
                    flatButtonWidth: SizeConverterFunction(
                      context: context,
                      size: 279.0,
                    ),
                    title: "정류장 살펴보기",
                  ),
                  onTap: ()=>_launchURL(busLink[2]),
                )
              ],
            ),
          ),
          CardFrameWidget(
            cardWidth: SizeConverterFunction(context: context, size: 337.0),
            cardHeight: SizeConverterFunction(context: context, size: 241.0),
            marginLeft: SizeConverterFunction(context: context, size: 20.0),
            marginRight: SizeConverterFunction(context: context, size: 20.0),
            marginTop: SizeConverterFunction(context: context, size: 20.0),
            marginBottom: SizeConverterFunction(context: context, size: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "성신교정 버스정보",
                      style: TextStyle(
                        fontSize:
                        SizeConverterFunction(context: context, size: 20.0),
                        color: Color(0XFF005EEC),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    BusFlatButtonWidget(
                      busFlatButtonSize:
                      SizeConverterFunction(context: context, size: 100.0),
                      busFlatButtonColor: Color(0XFF5D7BBE),
                      busFlatButtonIcon: Icons.directions_bus,
                      busFlatButtonTitle: "역곡역 → 학교",
                      busFlatButtonFunction: () => _launchURL(busLink[0]),
                    ),
                    BusFlatButtonWidget(
                      busFlatButtonSize:
                      SizeConverterFunction(context: context, size: 100.0),
                      busFlatButtonColor: Color(0XFF1AC7C3),
                      busFlatButtonIcon: Icons.directions_bus,
                      busFlatButtonTitle: "학교 → 역곡역",
                      busFlatButtonFunction: () => _launchURL(busLink[1]),
                    ),
                  ],
                ),
                InkWell(
                  child: FlatButtonWidget(
                    flatButtonHeight: SizeConverterFunction(
                      context: context,
                      size: 42.0,
                    ),
                    flatButtonWidth: SizeConverterFunction(
                      context: context,
                      size: 279.0,
                    ),
                    title: "정류장 살펴보기",
                  ),
                  onTap: ()=>_launchURL(busLink[2]),
                )
              ],
            ),
          ),
          CardFrameWidget(
            cardWidth: SizeConverterFunction(context: context, size: 337.0),
            cardHeight: SizeConverterFunction(context: context, size: 241.0),
            marginLeft: SizeConverterFunction(context: context, size: 20.0),
            marginRight: SizeConverterFunction(context: context, size: 20.0),
            marginTop: SizeConverterFunction(context: context, size: 20.0),
            marginBottom: SizeConverterFunction(context: context, size: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "성의교정 버스정보",
                      style: TextStyle(
                        fontSize:
                        SizeConverterFunction(context: context, size: 20.0),
                        color: Color(0XFF005EEC),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    BusFlatButtonWidget(
                      busFlatButtonSize:
                      SizeConverterFunction(context: context, size: 100.0),
                      busFlatButtonColor: Color(0XFF5D7BBE),
                      busFlatButtonIcon: Icons.directions_bus,
                      busFlatButtonTitle: "역곡역 → 학교",
                      busFlatButtonFunction: () => _launchURL(busLink[0]),
                    ),
                    BusFlatButtonWidget(
                      busFlatButtonSize:
                      SizeConverterFunction(context: context, size: 100.0),
                      busFlatButtonColor: Color(0XFF1AC7C3),
                      busFlatButtonIcon: Icons.directions_bus,
                      busFlatButtonTitle: "학교 → 역곡역",
                      busFlatButtonFunction: () => _launchURL(busLink[1]),
                    ),
                  ],
                ),
                InkWell(
                  child: FlatButtonWidget(
                    flatButtonHeight: SizeConverterFunction(
                      context: context,
                      size: 42.0,
                    ),
                    flatButtonWidth: SizeConverterFunction(
                      context: context,
                      size: 279.0,
                    ),
                    title: "정류장 살펴보기",
                  ),
                  onTap: ()=>_launchURL(busLink[2]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
