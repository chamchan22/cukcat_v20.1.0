import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuk/providers/provider_firebase-auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountControllerProvider with ChangeNotifier {
  bool _isSignIn = false;

  bool getAccountState() => _isSignIn;

//  getData(FirebaseUser user) async {
//    return await Firestore.instance.collection("users").getDocuments(user);
//  }

//  void getAccountInfo(FirebaseUser user) {
//    this.getData().then((querySnapshot){
//      querySnapshot.forEach(doc=>{)
//    });
//  }
  void test(FirebaseUser user) async {
    var ddd;
    await Firestore.instance
        .collection("users")
        .document(user.uid)
        .get()
        .then((DocumentSnapshot value) => ddd = value.data["nickname"]);
    print(user.uid);
    print(ddd);
  }

//  void setAccountState() {
//    if (_user == null) {
//      _isSignIn = false;
//    } else {
//      _isSignIn = true;
//    }
//    notifyListeners();
//  }
}
