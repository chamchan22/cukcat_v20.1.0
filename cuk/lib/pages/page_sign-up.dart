import 'dart:math';

import 'package:cuk/functions/function_alert-dialog.dart';
import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/providers/provider_firebase-auth.dart';
import 'package:cuk/states/state_random-nickname.dart';
import 'package:cuk/widgets/widget_card-frame.dart';
import 'package:cuk/widgets/widget_decorated-text.dart';
import 'package:cuk/widgets/widget_flat-button.dart';
import 'package:cuk/widgets/widget_sign-up-dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailConstroller = TextEditingController();
  TextEditingController _pwConstroller = TextEditingController();
  TextEditingController _cpwConstroller = TextEditingController();
  FirebaseAuthProvider firebaseProvider;

  @override
  void dispose() {
    _emailConstroller.dispose();
    _pwConstroller.dispose();
    _cpwConstroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    firebaseProvider = Provider.of<FirebaseAuthProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Align(
        alignment: Alignment.center,
        child: CardFrameWidget(
          cardWidth: MediaQuery.of(context).size.width * 0.85,
          cardHeight: MediaQuery.of(context).size.width * 1.3,
          paddingRight: MediaQuery.of(context).size.width * 0.1,
          paddingLeft: MediaQuery.of(context).size.width * 0.1,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Spacer(
                  flex: 2,
                ),
                Text(
                  "CUKCAT 회원가입",
                  style: TextStyle(
                    fontSize:
                        SizeConverterFunction(context: context, size: 20.0),
                    color: Color(0XFF005EEC),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                //이메일 input area
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "이메일",
                      style: TextStyle(
                        color: Color(0XFF005EEC),
                        fontSize:
                            SizeConverterFunction(context: context, size: 12.0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                        height: SizeConverterFunction(
                            context: context, size: 14.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.36,
                          height: SizeConverterFunction(
                            context: context,
                            size: 29.0,
                          ),
                          child: TextFormField(
                            controller: _emailConstroller,
                            decoration: getTextFieldDecor('Email', context),
                            validator: (String value) {
                              //이메일 input 조건
                              if (value.isEmpty) {
                                return 'Please enter your email address!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Text(
                          "@catholic.ac.kr",
                          style: TextStyle(
                              color: Color(0XFF005EEC),
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConverterFunction(
                                  context: context, size: 14.0)),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                    height:
                        SizeConverterFunction(context: context, size: 14.0)),
                //패스워드 input area
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "비밀번호",
                      style: TextStyle(
                        color: Color(0XFF005EEC),
                        fontSize:
                            SizeConverterFunction(context: context, size: 12.0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                        height: SizeConverterFunction(
                            context: context, size: 14.0)),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.744,
                      height: SizeConverterFunction(
                        context: context,
                        size: 29.0,
                      ),
                      child: TextFormField(
                        obscureText: true,
                        controller: _pwConstroller,
                        decoration: getTextFieldDecor('Password', context),
                        validator: (String value) {
                          //pw input 조건
                          if (value.isEmpty) {
                            return "빈칸은 허용할 수 없어요!!";
                          } else if (value.length < 6) {
                            return "비밀번호는 최소 6자리!!";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height:
                        SizeConverterFunction(context: context, size: 15.0)),
                //패스워드 확인
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "비밀번호 확인",
                      style: TextStyle(
                        color: Color(0XFF005EEC),
                        fontSize:
                            SizeConverterFunction(context: context, size: 12.0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                        height: SizeConverterFunction(
                            context: context, size: 14.0)),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.744,
                      height: SizeConverterFunction(
                        context: context,
                        size: 29.0,
                      ),
                      child: TextFormField(
                        obscureText: true,
                        controller: _cpwConstroller,
                        decoration: getTextFieldDecor('Password', context),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "빈칸은 허용할 수 없어요!!";
                          } else if (value != _pwConstroller.text) {
                            return "비밀번호가 달라요 :(";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                Spacer(
                  flex: 2,
                ),
                SizedBox(
                  height: SizeConverterFunction(context: context, size: 10.0),
                ),
                //회원가입 버튼
                InkWell(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      //메일이 와야 허용한다.
                      _register;
                    } else {
                      print('fail');
                    }
                  },
                  child: FlatButtonWidget(
                    flatButtonHeight: MediaQuery.of(context).size.width * 0.11,
                    flatButtonWidth: MediaQuery.of(context).size.width * 0.744,
                    title: "회원가입",
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration getTextFieldDecor(String hint, BuildContext context) {
    return InputDecoration(
        hintText: hint,
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
            fontSize: SizeConverterFunction(context: context, size: 14.0),
            color: Color(0XFFD1D8FF)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFFADC7F2),
          ),
        )
        //색깔을 바꾸고 싶은데 찾다가 시간없어서 우선 보내드립니다. 계속찾아보고 나오면 알려드릴게요
        );
  }

  get _register async {
    print('레지스터 시작');
    try {
      final AuthResult result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailConstroller.text + "@catholic.ac.kr",
        password: _pwConstroller.text,
      );

      final FirebaseUser user = result.user;

      String _randomNickNamec = _randomNickNameGenerator();
      if (user == null) {
        print('Please Try again later!');
      } else {
        user.sendEmailVerification();
        //사용자 생성하기 nickname 생성()
        Firestore.instance.collection("users").document(user.email).setData({
          "uid": user.uid,
          "nickname": _randomNickNamec,
          "email": user.email,
        });
      }

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 32.0),
                Text(
                  "랜덤 닉네임 생성!!",
                  style: TextStyle(
                    fontFamily: "NanumSquareExtraBold",
                    fontSize: 20.0,
                    color: Color(0XFF738AFF),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "닫기",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0XFF006DFF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            content: SizedBox(
              height: MediaQuery.of(context).size.width * 0.7,
              width: MediaQuery.of(context).size.width * 0.65,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "    당신의 닉네임은",
                        style: TextStyle(
                          color: Color(0XFF597194),
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    DecoratedTextWidget(
                      text: _randomNickNamec,
                      textSize: MediaQuery.of(context).size.width * 0.07,
                      textColor: Color(0XFFFFBB00),
                      backgroundColor: Color(0XFFF2F2F2),
                      paddingTop: 25.0,
                      paddingBottom: 25.0,
                      marginLeft: MediaQuery.of(context).size.width * 0.04,
                      marginRight: MediaQuery.of(context).size.width * 0.04,
                      borderRadius: 15.0,
                      textWeight: FontWeight.w900,
                      textFamily: "NanumSquareExtraBold",
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "입니다./(^ * ^)/    ",
                        style: TextStyle(
                          color: Color(0XFF597194),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchURL();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: FlatButtonWidget(
                        flatButtonHeight:
                            SizeConverterFunction(context: context, size: 40.0),
                        flatButtonWidth: SizeConverterFunction(
                            context: context, size: 226.0),
                        title: "이메일 인증하기",
                      ),
                    ),
                    Text(
                      "이메일 미인증 시 사용에 제한이 있습니다.",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (error) {
      switch (error.code) {
//        case "ERROR_INVALID_EMAIL":
//          Scaffold.of(context)
//              .showSnackBar(SnackBar(content: Text('이메일이 잘못된 형식입니다.')));
//          break;
//        case "ERROR_WRONG_PASSWORD":
////          Scaffold.of(context)
////              .showSnackBar(SnackBar(content: Text('비밀번호가 잘못 입력되었습니다.')));
////          break;
//        case "ERROR_USER_NOT_FOUND":
//          Scaffold.of(context)
//              .showSnackBar(SnackBar(content: Text('가입한 이메일이 존재하지 않습니다.')));
//          break;
        case "ERROR_USER_DISABLED":
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('차단된 계정입니다.')));
          // "User with this email has been disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('너무 많은 요청이 들어왔습니다. 잠시후 다시 시도해주세요')));
          // "Too many requests. Try again later.";
          break;
//        case "ERROR_OPERATION_NOT_ALLOWED":
//          Scaffold.of(context)
//              .showSnackBar(SnackBar(content: Text('이메일 혹은 비밀번호가 잘못되었습니다.')));
//          //"Signing in with Email and Password is not enabled.";
//          break;
        default:
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('가입한 이메일이 있습니다.')));
      }
    }
  }

  //send까지 잘만들어진 것이다.
  //email verify
  _launchURL() async {
    const url = 'https://mail.catholic.ac.kr/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
