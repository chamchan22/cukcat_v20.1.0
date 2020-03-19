import 'package:cuk/pages/page_sign-in.dart';
import 'package:cuk/pages/page_sign-up.dart';
import 'package:cuk/providers/provider_sign-form-controller.dart';
import 'package:cuk/widgets/widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignFormScreen extends StatefulWidget {
  @override
  _SignFormScreenState createState() => _SignFormScreenState();
}

class _SignFormScreenState extends State<SignFormScreen> {
  @override
  Widget build(BuildContext context) {
    SignFormController signFormController =
        Provider.of<SignFormController>(context);

    return Scaffold(
      appBar: AppBarWidget(
        type: "SignFormScreen",
        elevation: 1.0,
        signFormBackFunction: () {
          signFormController.setIsSignInFormDefault();
          Navigator.pop(context);
        },
        getIsSignInForm: signFormController.getIsSignInForm(),
        setSignFormChangeFunction: () {
          signFormController.setSignFormChange();
        },
      ),
      body: signFormController.getIsSignInForm() ? SignUpPage() : SignInPage(),
    );
  }
}

/*
AppBar(
        leading: InkWell(
          onTap: () {
            signFormController.setIsSignInFormDefault();
            Navigator.pop(context);
          },
          child: Icon(Icons.close),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text(
                signFormController.getIsSignInForm() ? "로그인" : "회원가입",
                style: TextStyle(
                  color: Color(0XFF4179EC),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  signFormController.setSignFormChange();
                },
                child: Icon(
                  Icons.supervised_user_circle,
                ),
              ),
              SizedBox(width: 10.0),
            ],
          )
        ],
      ),
 */
