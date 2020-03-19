import 'package:cuk/states/state_link.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuickLinkControllerProvider with ChangeNotifier {
  SharedPreferences prefs;
  List<String> _quickLinks = [];
  List<List<Map>> _linkState = LinkState;
  List<Map> _quickLinkSave = [];

  getQuickLinkSave() => _quickLinkSave;

  getQuickLinks() => _quickLinks;

  getPrefs() => prefs;

  setQuickLinks(List<String> quickLinks) => _quickLinks = quickLinks;

  setQuickLinkSave() {
    _quickLinkSave = [];
    for (int i = 0; i < _quickLinks.length; i++) {
      String value = _quickLinks[i]; //title
      for (int j = 0; j < 4; j++) {
        for (var k in _linkState[j]) {
          if (k.containsValue(value)) {
            _quickLinkSave.add(k);
          }
        }
      }
    }
    notifyListeners();
  }

  Future saveList() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setStringList("quickLinks", this.getQuickLinks());
  }

  setQuickLinkDelete(int index) {
    _quickLinks.removeAt(index);
    this.setQuickLinkSave();
    this.saveList();
    notifyListeners();
  }
}
