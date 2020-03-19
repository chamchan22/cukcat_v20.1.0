import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuk/functions/function_alert-dialog.dart';
import 'package:cuk/providers/provider_timer-setting.dart';
import 'package:cuk/screens/screen_home.dart';
import 'package:cuk/states/state_link.dart';
import 'package:cuk/states/state_random-nickname.dart';
import 'package:cuk/widgets/widget_appbar.dart';
import 'package:cuk/widgets/widget_circle-icon-avatar.dart';
import 'package:cuk/widgets/widget_curtain.dart';
import 'package:cuk/widgets/widget_decorated-text.dart';
import 'package:cuk/widgets/widget_sign-up-dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TimerSettingProvider _timerSettingProvider;
  var nowDate = DateTime.now().add(new Duration(days: -9));
  var _dateDate;
  var _endDate;
  var _test2;

  Future getNoticeList(String collectionId) async {
    var _test;

    await Firestore.instance
        .collection("notices/main-notices/2020-02")
        .getDocuments()
        .then((QuerySnapshot value) {
      _test2 = value.documents
          .map((DocumentSnapshot docSnapshot) => docSnapshot.data)
          .toList();
    });
    return _test2;
  }

  @override
  Widget build(BuildContext context) {
    _timerSettingProvider = Provider.of<TimerSettingProvider>(context);
    int now = 127;
    return Scaffold(
      appBar: AppBarWidget(type: "Home"),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () async {
//              print("nowDate : $nowDate");
//              var a = DateTime.parse("2020-03-17 15:57:40.423768");
//              print(a);
//              print(_endDate);
//              print(_endDate.difference(nowDate).inDays + 1);
              print(await getNoticeList('dd'));
              print(_test2[0]["writtenAt"].seconds);
              print(DateFormat('yyyy-MM-dd')
                  .format(
                    DateTime.fromMillisecondsSinceEpoch(
                      _test2[0]["writtenAt"].seconds * 1000,
                    ),
                  )
                  .toString());
              print(DateFormat("yyyy-MM-dd")
                  .format(DateTime.now().add(new Duration(hours: 9)))
                  .toString()
                  .substring(0, 7));
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
          ),
          FlatButton(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey,
              ),
              onPressed: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  onChanged: (datenow) {
                    setState(() {
                      print(datenow.toString());
                    });
                  },
                  onConfirm: (date) {
                    _endDate = date;
                    print(date.runtimeType);
                    now = date.difference(nowDate).inDays;
                    print(now + 1);
                  },
                  currentTime: nowDate,
                  locale: LocaleType.ko,
                );
              }),
          Text(now.toString()),
          SizedBox(height: 100),
          Stack(
            children: <Widget>[
              CircleIconAvatarWidget(
                size: 100.0,
                backgroundColor: Colors.green,
                isTitleRequire: true,
                title: "사이버캠퍼스",
              ),
            ],
          ),
          SizedBox(height: 100),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.width * 0.282,
                color: Color(0XFF94B7FF),
                child: Text("로그인")),
            Container(
              height: MediaQuery.of(context).size.width * 0.509,
              color: Color(0XFFF0F4FF),
            ),
          ],
        ),
      ),
    );
  }

  String _randomNickNameGenerator() {
    Random random1 = new Random();
    Random random2 = new Random();
    List<String> _nounList = nounList;
    List<String> _adjectiveList = adjectiveList;

    int randomNum1 = random1.nextInt(30);
    int randomNum2 = random2.nextInt(30);

    print(_adjectiveList[randomNum2] + _nounList[randomNum1]);

    return _adjectiveList[randomNum2] + _nounList[randomNum1];
  }

  Future _getImageUrl() async {
    final Future<StorageReference> ref = FirebaseStorage.instance
        .getReferenceFromUrl("gs://cukcat-40d1d.appspot.com/2019/375.jpg");
    dynamic url = await ref.then((doc) => doc.getDownloadURL());
    print(url);
    return url;
  }
}
