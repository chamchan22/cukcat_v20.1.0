import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuk/providers/provider_firebase-auth.dart';
import 'package:cuk/providers/provider_notice-selector.dart';
import 'package:cuk/providers/provider_quick-link-controller.dart';
import 'package:cuk/providers/provider_timer-setting.dart';
import 'package:cuk/screens/screen_calendar.dart';
import 'package:cuk/screens/screen_home.dart';
import 'package:cuk/screens/screen_link-list.dart';
import 'package:cuk/screens/screen_notice.dart';
import 'package:cuk/screens/screen_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainBottomTabNavScreen extends StatefulWidget {
  FirebaseAuthProvider firebaseProvider;

  @override
  _MainBottomTabNavScreenState createState() => _MainBottomTabNavScreenState();
}

class _MainBottomTabNavScreenState extends State<MainBottomTabNavScreen> {
  QuickLinkControllerProvider _quickLinkControllerProvider;
  TimerSettingProvider _timerSettingProvider;
  NoticeSelectorProvider _noticeSelectorProvider;
  int _selectedIndex = 0;
  SharedPreferences prefs;

  static List<Widget> _screenOptions = [
    HomeScreen(),
    LinkListScreen(),
    NoticeScreen(),
    CalendarScreen(),
    TestScreen(),
  ];

  String clubName = '';
  String imgUrl = '';
  List<String> ClubImageUrlList = List<String>();
  List<String> ClubNameList = List<String>();
  List<String> ClubImageUrlList2020 = List<String>();
  List<String> ClubNameList2020 = List<String>();

  Future getClubImage() async {
    ClubImageUrlList = [];
    ClubNameList = [];
    ClubImageUrlList2020 = [];
    ClubNameList2020 = [];
    //2020
    QuerySnapshot querySnapshot2020 = await Firestore.instance
        .collection("club")
        .document("2020")
        .collection("songsim")
        .getDocuments();
    querySnapshot2020.documents.forEach((doc) async {
      clubName = jsonEncode(doc['club-name']);
      imgUrl = jsonEncode(doc['image-url']);
      clubName = clubName.substring(0, clubName.length - 1);
      clubName = clubName.substring(1);

      imgUrl = imgUrl.substring(0, imgUrl.length - 1);
      imgUrl = imgUrl.substring(1);

      ClubNameList2020.add(clubName);
      ClubImageUrlList2020.add(imgUrl);
    });
    prefs.setStringList("dongari-imageurl-2020", ClubImageUrlList2020);
    prefs.setStringList("dongari-clubname-2020", ClubNameList2020);
    print(prefs.getStringList("dongari-imageurl-2020"));
    print(prefs.getStringList("dongari-clubname-2020"));

    //2019
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("club")
        .document("2019")
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

    prefs.setStringList("dongari-imageurl", ClubImageUrlList);
    prefs.setStringList("dongari-clubname", ClubNameList);

    print(prefs.getStringList("dongari-imageurl"));
    print(prefs.getStringList("dongari-clubname"));
  }

  @override
  void initState() {
    InitPrefs();
    super.initState();
  }

  InitPrefs() async {
    prefs = await SharedPreferences.getInstance(); //prefs에 내부 저장소를 가져오게 지정한다.

    List<String> _quickLinks = _quickLinkControllerProvider.getQuickLinks();
    if (prefs.getStringList("quickLinks") == null) {
      _quickLinks = ["사이버캠퍼스", "트리니티", "중앙도서관", "좌석 정보"];
      _quickLinkControllerProvider.setQuickLinks(_quickLinks);
      _quickLinkControllerProvider.setQuickLinkSave();
      _quickLinkControllerProvider.saveList();
    } else if (prefs.getStringList("quickLinks") != null) {
      _quickLinkControllerProvider
          .setQuickLinks(prefs.getStringList("quickLinks"));
      _quickLinkControllerProvider.setQuickLinkSave();
    }
    if (prefs.getStringList("dongari-imageurl") == null ||
        prefs.getStringList("dongari-imageurl-2020") == null) {
      getClubImage();
    }
    if (prefs.getStringList("timerList") == null) {
      print("hi");
      _timerSettingProvider
          .setStartDate(DateTime.now().add(new Duration(days: -9)));
      _timerSettingProvider
          .setEndDate(DateTime.now().add(new Duration(days: 100)));
      _timerSettingProvider.setTimerPrefs();
      _timerSettingProvider.setTimersettingDate();
      _timerSettingProvider.setDdayPercent();
    }else{
      _timerSettingProvider.setTimersettingDate();
      _timerSettingProvider.setDdayPercent();
    }

  }

  @override
  Widget build(BuildContext context) {
    _quickLinkControllerProvider =
        Provider.of<QuickLinkControllerProvider>(context);
    _timerSettingProvider = Provider.of<TimerSettingProvider>(context);
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screenOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Color(0XFFE2DCDC),
        selectedItemColor: Color(0XFF738AFF),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: null,
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            activeIcon: null,
            icon: Icon(Icons.category),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            activeIcon: null,
            icon: Icon(Icons.supervised_user_circle),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            activeIcon: null,
            icon: Icon(Icons.add),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            activeIcon: null,
            icon: Icon(Icons.add_to_home_screen),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
