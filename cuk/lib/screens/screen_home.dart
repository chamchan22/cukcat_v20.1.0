import 'package:cuk/pages/page_feature-list.dart';
import 'package:cuk/pages/page_home-drawer.dart';
import 'package:cuk/pages/page_new-feature-link.dart';
import 'package:cuk/pages/page_quick-slot.dart';
import 'package:cuk/pages/page_d-day-timer.dart';
import 'package:cuk/pages/page_user-account.dart';
import 'package:cuk/providers/provider_firebase-auth.dart';
import 'package:cuk/widgets/widget_appbar.dart';
import 'package:cuk/widgets/widget_card-frame.dart';
import 'package:cuk/widgets/widget_title-headline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

Logger logger = Logger();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuthProvider _firebaseAuthProvider;



  @override
  Widget build(BuildContext context) {
    _firebaseAuthProvider = Provider.of<FirebaseAuthProvider>(context);
    logger.d("user: ${_firebaseAuthProvider.getUser()}");
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(type: "HomeScreen"),
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.789,
          child: HomeDrawerPage(),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
              height: 100,
              color: Colors.grey,
            ),
            SizedBox(height: 23.0),
            TitleHeadLineWidget(
              title: "Quick Slot",
              titleColor: Color(0XFF718800),
            ),
            QuickSlotPage(isStackButtonRequire: false),
            NewFeatureLinkPage(),
            SizedBox(height: 23.0),
            TitleHeadLineWidget(
              title: "전체 기능",
              titleColor: Color(0XFF8582F6),
            ),
            FeatureListPage(),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
