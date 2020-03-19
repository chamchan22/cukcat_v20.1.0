import 'package:flutter/material.dart';

class ClubSearchOption with ChangeNotifier {
  String _valueYear = "2019";
  String _valueSchool = "성심교정";
  bool _isValueYear2020 = false;

  String getValueYear() => _valueYear;

  String getValueSchool() => _valueSchool;

  void setValueYear(String value) {
    _valueYear = value;
    notifyListeners();
  }

  void setValueSchool(String value) {
    _valueSchool = value;
    notifyListeners();
  }

  void setIsValueYear2020() {
    _valueYear == "2020" ? _isValueYear2020 = true : _isValueYear2020 = false;
    notifyListeners();
  }

  bool getIsValueYear2020() => _isValueYear2020;
}
