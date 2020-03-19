import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoticeSelectorProvider with ChangeNotifier {

  List _noticeList = [];

  String _collectionId;

  getNoticeList() => _noticeList;

  getCollectionId() {
    return _collectionId;
  }

  setCollectionId(String collectionId) {
    _collectionId = collectionId;
    this._setNoticeList();
    notifyListeners();
  }


  Future _setNoticeList() async {
    await Firestore.instance
        .collection("notices/main-notices/$_collectionId")
        .getDocuments()
        .then((QuerySnapshot value) {
      _noticeList = value.documents
          .map((DocumentSnapshot docSnapshot) => docSnapshot.data)
          .toList();
    });
  }

}
