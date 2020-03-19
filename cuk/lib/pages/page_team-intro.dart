import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/widgets/widget_card-frame.dart';
import 'package:flutter/material.dart';

class TeamIntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CardFrameWidget(
          cardWidth: SizeConverterFunction(context: context, size: 340.0),
          cardHeight: SizeConverterFunction(context: context, size: 300.0),
          marginTop: SizeConverterFunction(context: context, size: 15.0),
          marginRight: SizeConverterFunction(context: context, size: 18.0),
          marginLeft: SizeConverterFunction(context: context, size: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "v 20.1.0",
                    style: TextStyle(
                      color: Color(0XFF005EEC),
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: SizeConverterFunction(context: context, size: 139.0),
                    height:
                        SizeConverterFunction(context: context, size: 106.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              height: SizeConverterFunction(
                                  context: context, size: 40.0),
                              width: SizeConverterFunction(
                                  context: context, size: 40.0),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "백상우",
                              style: TextStyle(
                                  color: Color(0XFF738AFF),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          "▶ Project Manager",
                          style: TextStyle(
                            color: Color(0XFF8B8B8B),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          "▶ Full Stack Developer",
                          style: TextStyle(
                            color: Color(0XFF8B8B8B),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: SizeConverterFunction(context: context, size: 139.0),
                    height:
                        SizeConverterFunction(context: context, size: 106.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              height: SizeConverterFunction(
                                  context: context, size: 40.0),
                              width: SizeConverterFunction(
                                  context: context, size: 40.0),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "한영찬",
                              style: TextStyle(
                                  color: Color(0XFF738AFF),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          "▶ Frontend Developer",
                          style: TextStyle(
                            color: Color(0XFF8B8B8B),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          "▶ ux/ui Designer",
                          style: TextStyle(
                            color: Color(0XFF8B8B8B),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          "▶ 앱 기획자",
                          style: TextStyle(
                            color: Color(0XFF8B8B8B),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: SizeConverterFunction(context: context, size: 139.0),
                    height:
                        SizeConverterFunction(context: context, size: 106.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              height: SizeConverterFunction(
                                  context: context, size: 40.0),
                              width: SizeConverterFunction(
                                  context: context, size: 40.0),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "박진우",
                              style: TextStyle(
                                  color: Color(0XFF738AFF),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          "▶ Backend  Developer",
                          style: TextStyle(
                            color: Color(0XFF8B8B8B),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          "▶ Security Manager",
                          style: TextStyle(
                            color: Color(0XFF8B8B8B),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: SizeConverterFunction(context: context, size: 139.0),
                    height:
                        SizeConverterFunction(context: context, size: 106.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              height: SizeConverterFunction(
                                  context: context, size: 40.0),
                              width: SizeConverterFunction(
                                  context: context, size: 40.0),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "안수빈",
                              style: TextStyle(
                                  color: Color(0XFF738AFF),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          "▶ Soldier",
                          style: TextStyle(
                            color: Color(0XFF8B8B8B),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          "▶ Backend Developer",
                          style: TextStyle(
                            color: Color(0XFF8B8B8B),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
