import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/pages/page_d-day-timer.dart';
import 'package:cuk/pages/page_user-account.dart';
import 'package:cuk/providers/provider_firebase-auth.dart';
import 'package:cuk/widgets/widget_curtain.dart';
import 'package:cuk/widgets/widget_title-headline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDrawerPage extends StatefulWidget {
  @override
  _HomeDrawerPageState createState() => _HomeDrawerPageState();
}

class _HomeDrawerPageState extends State<HomeDrawerPage> {
  FirebaseAuthProvider _firebaseAuthProvider;

  @override
  Widget build(BuildContext context) {
    _firebaseAuthProvider = Provider.of<FirebaseAuthProvider>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountPage(),
          Stack(
            children: <Widget>[
              Container(
                color: Color(0XFFF0F4FF),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: SizeConverterFunction(context: context, size: 10.0),
                    right: SizeConverterFunction(context: context, size: 10.0),
                    top: SizeConverterFunction(context: context, size: 10.0),
                    bottom: SizeConverterFunction(context: context, size: 10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "CUKCAT TIMER",
                            style: TextStyle(
                              fontSize: SizeConverterFunction(
                                  context: context, size: 18.0),
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF738AFF),
                            ),
                          ),
                          Spacer(flex: 1),
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              '/feature/cukcatTimer',
                              arguments: true,
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.settings,
                                  size: SizeConverterFunction(
                                      context: context, size: 12.0),
                                  color: Color(0XFFBDBDBD),
                                ),
                                Text(
                                  "setting",
                                  style: TextStyle(
                                    fontSize: SizeConverterFunction(
                                        context: context, size: 12.0),
                                    color: Color(0XFFBDBDBD),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConverterFunction(
                          context: context,
                          size: 5.0,
                        ),
                      ),
                      DdayTimerPage(),
                    ],
                  ),
                ),
              ),
              CurtainWidget(
                isCurtainVisible:
                    _firebaseAuthProvider.getUser() == null ? true : false,
                curtainWidth: MediaQuery.of(context).size.width * 0.789,
                curtainHeight: SizeConverterFunction(
                  context: context,
                  size: 176.0,
                ),
              ),
            ],
          ),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height:
                        SizeConverterFunction(context: context, size: 10.0)),
                TitleHeadLineWidget(
                  title: "Menu",
                  titleColor: Color(0XFF738AFF),
                ),
                LimitedBox(
                  maxHeight:
                      SizeConverterFunction(context: context, size: 156.0),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/help',
                            arguments: "teamintro"),
                        child: ListTile(
                          leading: Icon(
                            Icons.help,
                            size: SizeConverterFunction(
                                context: context, size: 25.0),
                            color: Color(0XFFA5BEF0),
                          ),
                          title: Text(
                            "CATSTONES 팀 소개",
                            style: TextStyle(
                              fontSize: SizeConverterFunction(
                                  context: context, size: 16.0),
                              color: Color(0XFF959CBD),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: SizeConverterFunction(
                                  context: context, size: 35.0)),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/help',
                            arguments: "advertise"),
                        child: ListTile(
                          leading: Icon(
                            Icons.live_tv,
                            size: SizeConverterFunction(
                                context: context, size: 25.0),
                            color: Color(0XFFA5BEF0),
                          ),
                          title: Text(
                            "광고 문의",
                            style: TextStyle(
                              fontSize: SizeConverterFunction(
                                  context: context, size: 16.0),
                              color: Color(0XFF959CBD),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: SizeConverterFunction(
                                  context: context, size: 35.0)),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/help',
                            arguments: "license"),
                        child: ListTile(
                          leading: Icon(
                            Icons.bookmark,
                            size: SizeConverterFunction(
                                context: context, size: 25.0),
                            color: Color(0XFFA5BEF0),
                          ),
                          title: Text(
                            "라이센스",
                            style: TextStyle(
                              fontSize: SizeConverterFunction(
                                  context: context, size: 16.0),
                              color: Color(0XFF959CBD),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: SizeConverterFunction(
                                  context: context, size: 35.0)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              _firebaseAuthProvider.signOut();
              Navigator.pop(context);
            },
            child: Visibility(
              visible: _firebaseAuthProvider.isSignIn(),
              child: Container(
                  height: MediaQuery.of(context).size.width * 0.16,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                          width: SizeConverterFunction(
                              context: context, size: 30.0)),
                      Icon(
                        Icons.input,
                        size:
                            SizeConverterFunction(context: context, size: 25.0),
                        color: Color(0XFF9E9E9E),
                      ),
                      SizedBox(
                          width: SizeConverterFunction(
                              context: context, size: 10.0)),
                      Text(
                        "Log out",
                        style: TextStyle(
                          fontSize: SizeConverterFunction(
                              context: context, size: 20.0),
                          color: Color(0XFF9E9E9E),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
