//로그인 페이지
import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/providers/provider_firebase-auth.dart';
import 'package:cuk/providers/provider_sign-form-controller.dart';
import 'package:cuk/widgets/widget_card-frame.dart';
import 'package:cuk/widgets/widget_flat-button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //input 제어는 코딩파파와 동일
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailConstroller = TextEditingController();
  TextEditingController _pwConstroller = TextEditingController();
  FirebaseAuthProvider firebaseProvider;

  @override
  void dispose() {
    _emailConstroller.dispose();
    _pwConstroller.dispose();
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
      body: Center(
        child: CardFrameWidget(
          cardWidth: MediaQuery.of(context).size.width * 0.85,
          cardHeight: MediaQuery.of(context).size.width * 1.2986,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(
                  flex: 3,
                ),
                Text(
                  "CUKCAT 로그인",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0XFF005EEC),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.744,
                  height: MediaQuery.of(context).size.width * 0.128,
                  child: TextFormField(
                    obscureText: true,
                    controller: _pwConstroller,
                    decoration: getTextFieldDecor('Password'),
                    validator: (String value) {
                      //pw input 조건
                      if (value.isEmpty) {
                        return "빈칸은 허용할 수 없어요:)";
                      }
                      return null;
                    },
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/reset-password'),
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: SizeConverterFunction(
                        context: context,
                        size: 20.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "비밀번호 찾기",
                        style: TextStyle(
                          color: Color(0XFF9E9E9E),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                //로그인 버튼
                InkWell(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      _login;
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('형식 검사 통과!!')));
                      //모달 추가해야함
                    } else {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('fail')));
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
                        "로그인",
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
                //회원가입 버튼
                InkWell(
                  onTap: () => signFormController.setSignFormChange(),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0XFF738AFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    width: MediaQuery.of(context).size.width * 0.744,
                    height: MediaQuery.of(context).size.width * 0.125,
                    child: Center(
                      child: Text(
                        "회원가입",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0XFF738AFF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  "CUKCAT v20.1.0",
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Color(0XFFB9B9B9),
                  ),
                ),
                Text(
                  "copyright by CATSTONES 2020",
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Color(0XFFB9B9B9),
                  ),
                ),
                Spacer(
                  flex: 2,
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
        filled: true);
  }

  get _login async {
    try {
      AuthResult result =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailConstroller.text,
        password: _pwConstroller.text,
      );
      FirebaseUser user = result.user;

      if (user.hashCode == null) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('회원가입이 안된 유저입니다.')));
        print("회원가입이 안되어있습니다");
      } else {
        if (user.isEmailVerified) {
          print("email인증이 되었습니다");
          Navigator.pop(
            context,
            '/',
          );
          firebaseProvider.setUser(user); //인증 된 사람을 기억한다.
          // fAuth.sendPasswordResetEmail(email: _emailConstroller.text);
        } else {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('email 인증을 하세요!!!')));
        }
      }
    } catch (error) {
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('이메일이 잘못된 형식입니다.')));
          break;
        case "ERROR_WRONG_PASSWORD":
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('비밀번호가 잘못 입력되었습니다.')));
          break;
        case "ERROR_USER_NOT_FOUND":
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('가입한 이메일이 존재하지 않습니다.')));
          break;
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
        case "ERROR_OPERATION_NOT_ALLOWED":
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('이메일 혹은 비밀번호가 잘못되었습니다.')));
          //"Signing in with Email and Password is not enabled.";
          break;
        default:
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('이메일 혹은 비밀번호가 잘못되었을까요?.')));
      }
    }
  }
}
