import 'package:cuk/providers/provider_account-controller.dart';
import 'package:cuk/providers/provider_firebase-auth.dart';
import 'package:cuk/widgets/widget_circle-icon-avatar.dart';
import 'package:cuk/widgets/widget_user-info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAccountPage extends StatefulWidget {
  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  AccountControllerProvider _accountControllerProvider;
  FirebaseAuthProvider _firebaseAuthProvider;

  @override
  Widget build(BuildContext context) {
    _accountControllerProvider =
        Provider.of<AccountControllerProvider>(context);
    _firebaseAuthProvider = Provider.of<FirebaseAuthProvider>(context);
    return InkWell(
      onTap: (){
        if(_firebaseAuthProvider.isSignIn()){
          return null;
        }
        else{
          Navigator.pop(context);
          Navigator.pushNamed(context, '/signform');
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.282,
        color: Color(0XFF94B7FF),
        child: UserInfoWidget(
          context: context,
          userAvatarWidget: CircleIconAvatarWidget(
            size: MediaQuery.of(context).size.width * 0.11,
            backgroundColor: Color(0XFF4C7DE1),
            isTitleRequire: false,
            icon: Icons.person,
          ),
          userInfoHeight: MediaQuery.of(context).size.width * 0.11,
          userName: _firebaseAuthProvider.getUserNickName(),
          userEmail: _firebaseAuthProvider.getUserEmail(),
          isSignIn: _firebaseAuthProvider.isSignIn(),
        ),
      ),
    );
  }
}
