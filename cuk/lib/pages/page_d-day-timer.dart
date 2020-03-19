import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/providers/provider_timer-setting.dart';
import 'package:cuk/widgets/widget_decorated-text.dart';
import 'package:cuk/widgets/widget_horizontal-line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DdayTimerPage extends StatefulWidget {
  @override
  _DdayTimerPageState createState() => _DdayTimerPageState();
}

class _DdayTimerPageState extends State<DdayTimerPage> {
  TimerSettingProvider _timerSettingProvider;

  @override
  Widget build(BuildContext context) {
    _timerSettingProvider = Provider.of<TimerSettingProvider>(context);

    bool _isVisible = ModalRoute.of(context).settings.arguments;
    return Column(
      children: <Widget>[
        Visibility(
          visible: _isVisible ?? false,
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.settings,
                  size: SizeConverterFunction(context: context, size: 15.0),
                  color: Color(0XFF005EEC),
                ),
                Text(
                  " Dday Timer",
                  style: TextStyle(
                    color: Color(0XFF005EEC),
                    fontSize: SizeConverterFunction(context: context, size: 15.0),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.744,
          height: MediaQuery.of(context).size.width * 0.36,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  SizedBox(width: 30.0),
                  DecoratedTextWidget(
                    text: "종강",
                    textSize: 20.0,
                    textColor: Color(0XFF738AFF),
                    backgroundColor: Color(0XFFF0F4FF),
                    textWeight: FontWeight.w600,
                  ),
                  Text(
                    "까지",
                    style: TextStyle(
                      color: Color(0XFF738AFF),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Color(0XFFFFBF77)),
                      children: <TextSpan>[
                        TextSpan(
                          text: _timerSettingProvider.getDday().toString(),
                          style: TextStyle(
                            fontSize: 37.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' 일   ',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '남았어요.',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0XFF738AFF),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40.0),
                ],
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    Center(
                        child: Image.asset(
                      "lib/assets/images/time-line.png",
                      width: SizeConverterFunction(
                        context: context,
                        size: 270.0,
                      ),
                    )),
                    Positioned(
                      //시작은 왼쪽으로 부터 24픽셀 이동 후 시작
                      //끝은 왼쪽으로 부터 251픽셀 이동 후 종료
                      left: SizeConverterFunction(
                        context: context,
                        size: 24.0 + 227.0 * _timerSettingProvider.getDdayPercent(),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Today",
                            style: TextStyle(
                              fontSize: SizeConverterFunction(
                                context: context,
                                size: 10.0,
                              ),
                              color: Color(0XFFFF6666),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Container(
                            width: SizeConverterFunction(
                              context: context,
                              size: 10.0,
                            ),
                            height: SizeConverterFunction(
                              context: context,
                              size: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0XFFFF6666),
                              border: Border.all(
                                width: 2.0,
                                color: Color(0XFFFFBCBC),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/*
Container(
                  color: Colors.grey,
                  height: 10.0,
                  width: 270.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 10,
                        height: 10,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 1.0,
                        color: Colors.black,
                        width: 250,
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
 */
