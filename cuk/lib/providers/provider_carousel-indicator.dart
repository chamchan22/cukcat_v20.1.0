import 'package:flutter/material.dart';

class CarouselIndicatorProvider with ChangeNotifier {
  int _currentIndex = 0;

  void setCurrentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  int getCurrentIndex() => _currentIndex;
}
