//로그인 페이지
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/providers/provider_firebase-auth.dart';
import 'package:cuk/providers/provider_sign-form-controller.dart';
import 'package:cuk/states/state_random-nickname.dart';
import 'package:cuk/widgets/widget_card-frame.dart';
import 'package:cuk/widgets/widget_flat-button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  //input 제어는 코딩파파와 동일
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailConstroller = TextEditingController();
  FirebaseAuthProvider firebaseProvider;

  @override
  void dispose() {
    _emailConstroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SignFormController signFormController =
        Provider.of<SignFormController>(context);
    firebaseProvider = Provider.of<FirebaseAuthProvider>(context);

    return Scaffold(
      //리사이즈 할때 body나 scaffold 위젯이 높이가 정의된 스크린 키보드에 의해 스스로 크기를 재조정
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Center(
        child: CardFrameWidget(
          cardWidth: MediaQuery.of(context).size.width * 0.85,
          cardHeight: MediaQuery.of(context).size.width * 0.8,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(flex: 1),
                Text(
                  "비밀번호 찾기",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0XFF005EEC),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Spacer(flex: 1),
                //이메일 input area
                Container(
                  width: MediaQuery.of(context).size.width * 0.744,
                  height: MediaQuery.of(context).size.width * 0.128,
                  child: TextFormField(
                    controller: _emailConstroller,
                    decoration: getTextFieldDecor('Email'),
                    validator: (String value) {
                      //이메일 input 조건
                      if (value.isEmpty) {
                        return "빈칸은 허용할 수 없어요:)";
                      } else if (!value.contains("@catholic.ac.kr")) {
                        return "이메일은 '@catholic.ac.kr'만 허용합니다.";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //패스워드 input area
                SizedBox(
                  height: 16,
                ),
                //로그인 버튼
                InkWell(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      FirebaseAuth.instance.sendPasswordResetEmail(
                        email: _emailConstroller.text,
                      );
                      print("성공");
                      //모달 추가해야함
                    } else {
                      print("실패");
                    }
                    //모달 추가해야함
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF738AFF),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    width: MediaQuery.of(context).size.width * 0.744,
                    height: MediaQuery.of(context).size.width * 0.125,
                    child: Center(
                      child: Text(
                        "비밀번호 초기화",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration getTextFieldDecor(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Color(0XFFD1D8FF)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0XFFA3C0F1),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0XFFA3C0F1),
          width: 1,
        ),
      ),
      fillColor: Colors.white,
      filled: true,
    );
  }

  String _randomNickNameGenerator() {
    Random random1 = new Random();
    Random random2 = new Random();
    List<String> _nounList = nounList;
    List<String> _adjectiveList = adjectiveList;

    int randomNum1 = random1.nextInt(30);
    int randomNum2 = random2.nextInt(30);

    logger.d(_adjectiveList[randomNum2] + " " + _nounList[randomNum1]);

    return _adjectiveList[randomNum2] + " " + _nounList[randomNum1];
  }
}
