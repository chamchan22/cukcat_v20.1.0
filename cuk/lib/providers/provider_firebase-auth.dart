import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class FirebaseAuthProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth =
      FirebaseAuth.instance; //Firebase 인증 플러그인의 인스턴스
  FirebaseUser _user; // Firebase에 로그인 된 사용자

  String _lastFirebaseResponse = ""; //Firebase로부터 받은 최신 메시지 (에러 처리용)
  String _userNickName = "방문객";
  String _userEmail = "로그인하세요.";

  FirebaseAuthProvider() {
    logger.d("init FirebaseProvider");
    _prepareUser();
  }

  FirebaseUser getUser() {
    return _user;
  }

  String getUserNickName() => _userNickName;

  String getUserEmail() => _userEmail;

  bool isSignIn() {
    if (this.getUser() == null) {
      return false;
    } else {
      return true;
    }
  }

  void setUser(FirebaseUser value) {
    _user = value;

    if (_user != null) {
      this
          .getUserNickNameInFireStore(_user)
          .then((value) => _userNickName = value);
      _userEmail = _user.email;
    }

    notifyListeners();
  }

  // 최근 Firebase에 로그인한 사용자의 정보 획득
  _prepareUser() {
    firebaseAuth.currentUser().then((FirebaseUser currentUser) {
      setUser(currentUser);
      this
          .getUserNickNameInFireStore(_user)
          .then((value) => _userNickName = value);
      _userEmail = _user.email;
    });
  }

  Future<String> getUserNickNameInFireStore(FirebaseUser user) async {
    String _nickName;
    await Firestore.instance
        .collection("users")
        .document(user.email)
        .get()
        .then((DocumentSnapshot value) => _nickName = value.data["nickname"]);
    return _nickName;
  }

  // 이메일/비밀번호로 Firebase에 회원가입
  Future<bool> signUpWithEmail(String email, String password) async {
    try {
      AuthResult result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        // 인증 메일 발송
        result.user.sendEmailVerification();
        // 새로운 계정 생성이 성공하였으므로 기존 계정이 있을 경우 로그아웃 시킴
        signOut();
        return true;
      }
    } on Exception catch (e) {
      logger.e(e.toString());
      List<String> result = e.toString().split(", ");
      setLastFBMessage(result[1]);
      return false;
    }
  }

  // 이메일/비밀번호로 Firebase에 로그인
  Future<bool> signInWithEmail(String email, String password) async {
    try {
      var result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result != null) {
        setUser(result.user);
        logger.d(getUser());
        this
            .getUserNickNameInFireStore(_user)
            .then((value) => _userNickName = value);
        return true;
      }
      return false;
    } on Exception catch (e) {
      logger.e(e.toString());
      List<String> result = e.toString().split(", ");
      setLastFBMessage(result[1]);
      return false;
    }
  }

  // Firebase로부터 로그아웃
  signOut() async {
    await firebaseAuth.signOut();
    _userNickName = "방문객";
    _userEmail = "로그인하세요.";
    setUser(null);
  }

  // 사용자에게 비밀번호 재설정 메일을 영어로 전송 시도
  sendPasswordResetEmailByEnglish() async {
    await firebaseAuth.setLanguageCode("en");
    sendPasswordResetEmail();
  }

  // 사용자에게 비밀번호 재설정 메일을 한글로 전송 시도
  sendPasswordResetEmailByKorean() async {
    await firebaseAuth.setLanguageCode("ko");
    sendPasswordResetEmail();
  }

  // 사용자에게 비밀번호 재설정 메일을 전송
  sendPasswordResetEmail() async {
    firebaseAuth.sendPasswordResetEmail(email: getUser().email);
  }

  // Firebase로부터 회원 탈퇴
  withdrawalAccount() async {
    await getUser().delete();
    setUser(null);
  }

  // Firebase로부터 수신한 메시지 설정
  setLastFBMessage(String msg) {
    _lastFirebaseResponse = msg;
  }

  // Firebase로부터 수신한 메시지를 반환하고 삭제
  getLastFBMessage() {
    String returnValue = _lastFirebaseResponse;
    _lastFirebaseResponse = null;
    return returnValue;
  }
}
