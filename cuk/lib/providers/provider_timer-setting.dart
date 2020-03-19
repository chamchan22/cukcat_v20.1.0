import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerSettingProvider with ChangeNotifier {
  SharedPreferences prefs;
  List<String> _timerList = List<String>();
  DateTime _startDate;
  DateTime _endDate;
  DateTime _nowDate = DateTime.now().add(new Duration(days: 9));
  int _Dday;
  int _Baseday;
  double _percent;

  //getter
  int getDday() => _Dday;

  DateTime getNowDate() => _nowDate;

  DateTime getStartDate() => _startDate;

  DateTime getEndDate() => _endDate;

  String getStartDateToString() => _startDate.toString().substring(0, 10);

  String getEndDateToString() => _endDate.toString().substring(0, 10);

  double getDdayPercent() {
    _Baseday = _endDate.difference(_startDate).inDays + 1;
    print(_Baseday - _Dday);
    return (_Baseday - _Dday) / _Baseday;
  }

  double setDdayPercent(){
    _Baseday = _endDate.difference(_startDate).inDays + 1;
    _percent = (_Baseday - _Dday) / _Baseday;
  }

  //setter
  // _ 가 붙은건 내부에서 사용하는 메소드
  DateTime setStartDate(DateTime startDate) {
    _startDate = startDate;
    notifyListeners();
  }

  DateTime setEndDate(DateTime endDate) {
    _endDate = endDate;
    notifyListeners();
  }

  //스트링으로 변환후 집어넣는 로직(create 할때 사용)
  void setTimerPrefs() async {
    prefs = await SharedPreferences.getInstance();
    _timerList = [];
    _timerList.add(_startDate.toString());
    _timerList.add(_endDate.toString());
    print("ddd:${_startDate.toString().substring(0, 10)}");
    print("_startDate : $_startDate");
    print("_endDate : $_endDate");
    print(_timerList);
    print('ddd');
    prefs.setStringList("timerList", _timerList);

    this._setDday();
    print('final');
  }

  //스트링을 DateTime 으로 변환하는 로직(always)
  Future setTimersettingDate() async {
    prefs = await SharedPreferences.getInstance();
    _timerList = prefs.getStringList("timerList");
    print(_timerList);
    this.setStartDate(DateTime.parse(_timerList[0]));
    this.setEndDate(DateTime.parse(_timerList[1]));
    this._setDday();
    notifyListeners();
  }

  //계산된 차이 값을 반환하는 로직(변환 후 항상 사용)
  void _setDday() {
    print('kkkk');
    print(_nowDate);
    print(_endDate);
    _Dday = _endDate.difference(_nowDate).inDays + 1;
    print(_Dday);
    if (_Dday < 0) {
      _Dday = 0;
    }
    print(_Dday);
    notifyListeners();
  }

  //prefs 함수들(save, read)
  Future _saveStringList(String key, List<String> list) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, list);
  }

  Future _readStringList(String key, List<String> list) async {
    prefs = await SharedPreferences.getInstance();
    list = prefs.getStringList(key);
    print(list);
  }
}
