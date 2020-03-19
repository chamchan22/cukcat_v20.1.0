import 'package:cuk/providers/provider_firebase-auth.dart';
import 'package:cuk/widgets/widget_card-frame.dart';
import 'package:cuk/widgets/widget_circle-icon-avatar.dart';
import 'package:cuk/widgets/widget_curtain.dart';
import 'package:cuk/widgets/widget_feature-element.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeatureListPage extends StatefulWidget {
  @override
  _FeatureListPageState createState() => _FeatureListPageState();
}

class _FeatureListPageState extends State<FeatureListPage> {
  FirebaseAuthProvider _firebaseAuthProvider;

  @override
  Widget build(BuildContext context) {
    _firebaseAuthProvider = Provider.of<FirebaseAuthProvider>(context);
    List<Map<dynamic, dynamic>> featureList = [
      {
        "title": "동아리 둘러보기",
        "definition": "가톨릭 대학교 성심교정의 동아리를 확인하세요!",
        "icon": Icons.bookmark,
        "isAvatarLeft": true,
        "color": Color(0XFFFFF596),
        "function": () => Navigator.pushNamed(
              context,
              "/feature/clubChannel",
            ),
      },
      {
        "title": "CUKCAT TIMER",
        "definition": "CUKCAT이 제공하는 D-day 타이머를 사용해보세요!",
        "icon": Icons.bookmark,
        "isAvatarLeft": true,
        "color": Color(0XFFFFF596),
        "function": () => Navigator.pushNamed(
              context,
              "/feature/cukcatTimer",
              arguments: true,
            ),
      },
      {
        "title": "버스 정보(성심교정)",
        "definition": "역곡역에서 가톨릭대학교(성심교정)까지 버스 정보를 확인하세요!",
        "icon": Icons.directions_bus,
        "isAvatarLeft": true,
        "color": Color(0XFFFFF596),
        "function": () => Navigator.pushNamed(
              context,
              "/feature/busInfo",
            ),
      },
    ];
    return Column(
      children: featureList
          .map<Widget>(
            (element) => Stack(
              children: <Widget>[
                CardFrameWidget(
                  onTapFunction: element["function"],
                  cardWidth: MediaQuery.of(context).size.width * 0.904,
                  cardHeight: MediaQuery.of(context).size.width * 0.226,
                  marginTop: 13.0,
                  paddingRight: 20.0,
                  paddingLeft: 20.0,
                  paddingBottom: 10.0,
                  paddingTop: 10.0,
                  child: FeatureElementWidget(
                    circleIconAvatar: CircleIconAvatarWidget(
                      size: MediaQuery.of(context).size.width * 0.15,
                      backgroundColor: element["color"],
                      isTitleRequire: false,
                      icon: element["icon"],
                    ),
                    isAvatarLeft: element["isAvatarLeft"],
                    title: element["title"],
                    definition: element["definition"],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: CurtainWidget(
                    curtainWidth: MediaQuery.of(context).size.width * 0.904,
                    curtainHeight: MediaQuery.of(context).size.width * 0.226,
                    isCurtainVisible:
                        _firebaseAuthProvider.getUser() == null ? true : false,
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
