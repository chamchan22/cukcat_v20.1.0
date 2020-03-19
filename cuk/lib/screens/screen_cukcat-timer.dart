import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/pages/page_d-day-timer.dart';
import 'package:cuk/pages/page_timer-setting.dart';
import 'package:cuk/widgets/widget_card-frame.dart';
import 'package:flutter/material.dart';

class CukCatTimerScreen extends StatefulWidget {
  @override
  _CukCatTimerScreenState createState() => _CukCatTimerScreenState();
}

class _CukCatTimerScreenState extends State<CukCatTimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          CardFrameWidget(
            marginLeft: SizeConverterFunction(context: context, size: 35.0),
            marginRight: SizeConverterFunction(context: context, size: 35.0),
            marginTop: SizeConverterFunction(context: context, size: 15.0),
            marginBottom: SizeConverterFunction(context: context, size: 15.0),
            paddingBottom: SizeConverterFunction(context: context, size: 10.0),
            paddingLeft: SizeConverterFunction(context: context, size: 10.0),
            paddingRight: SizeConverterFunction(context: context, size: 10.0),
            paddingTop: SizeConverterFunction(context: context, size: 10.0),
            cardWidth: SizeConverterFunction(context: context, size: 292.0),
            cardHeight: SizeConverterFunction(context: context, size: 175.0),
            child: DdayTimerPage(),
          ),
          CardFrameWidget(
            cardWidth: SizeConverterFunction(context: context, size: 292.0),
            cardHeight: SizeConverterFunction(context: context, size: 180.0),
            marginLeft: SizeConverterFunction(context: context, size: 35.0),
            marginRight: SizeConverterFunction(context: context, size: 35.0),
            marginTop: SizeConverterFunction(context: context, size: 15.0),
            marginBottom: SizeConverterFunction(context: context, size: 15.0),
            paddingBottom: SizeConverterFunction(context: context, size: 10.0),
            paddingLeft: SizeConverterFunction(context: context, size: 10.0),
            paddingRight: SizeConverterFunction(context: context, size: 10.0),
            paddingTop: SizeConverterFunction(context: context, size: 10.0),
            child: TimerSettingPage(),
          )
        ],
      ),
    );
  }
}
