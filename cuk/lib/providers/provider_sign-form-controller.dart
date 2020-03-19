import 'package:flutter/material.dart';

class SignFormController with ChangeNotifier {
  bool _isSignInForm = false;

  bool getIsSignInForm() => _isSignInForm;

  bool setIsSignInFormDefault() => _isSignInForm = false;

  void setSignFormChange() {
    _isSignInForm = !_isSignInForm;
    notifyListeners();
  }
}