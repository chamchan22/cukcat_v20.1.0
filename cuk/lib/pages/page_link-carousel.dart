import 'package:carousel_slider/carousel_slider.dart';
import 'package:cuk/functions/function_alert-dialog.dart';
import 'package:cuk/providers/provider_carousel-indicator.dart';
import 'package:cuk/providers/provider_quick-link-controller.dart';
import 'package:cuk/states/state_link.dart';
import 'package:cuk/widgets/widget_card-frame.dart';
import 'package:cuk/widgets/widget_carousel-indicator.dart';
import 'package:cuk/widgets/widget_circle-icon-avatar.dart';
import 'package:cuk/widgets/widget_decorated-text.dart';
import 'package:cuk/widgets/widget_sign-up-dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkCarouselPage extends StatefulWidget {
  @override
  _LinkCarouselPageState createState() => _LinkCarouselPageState();
}

class _LinkCarouselPageState extends State<LinkCarouselPage> {
  QuickLinkControllerProvider _quickLinkControllerProvider;
  CarouselIndicatorProvider carouselIndicatorProvider;
  SharedPreferences prefs;
  List<String> _quickLinks = [];

  //List<String> _quickLinks = [];
  List<List<Map>> _linkState = LinkState;
  List<Map> _quickLinkSave = [];

/*
  InitPrefs() async {
    print("initPrefs");
    prefs = await SharedPreferences.getInstance(); //prefs에 내부 저장소를 가져오게 지정한다.
    if (prefs.getStringList("quickLinks") == null) {
      return _quickLinks = [];
    } else {
      //prefs.setStringList("quickLinks", _quickLinks);
      _quickLinks = prefs.getStringList("quickLinks");
      print(_quickLinks);
    }
  }

  @override
  void initState() {
    super.initState();
    InitPrefs();
  }

 */
  Future<bool> _saveList(List list) async {
    return await prefs.setStringList("key", list);
  }

  List<String> _getList() {
    return prefs.getStringList("key");
  }

  @override
  Widget build(BuildContext context) {
    carouselIndicatorProvider = Provider.of<CarouselIndicatorProvider>(context);
    _quickLinkControllerProvider =
        Provider.of<QuickLinkControllerProvider>(context);

    return Container(
//      color: Colors.red,
      height: MediaQuery.of(context).size.width * 1.138,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          CarouselIndicatorWidget(
            width: MediaQuery.of(context).size.width * 0.57,
            currentIndex: carouselIndicatorProvider.getCurrentIndex(),
          ),
          SizedBox(height: 5.0),
          Container(
            height: MediaQuery.of(context).size.width * 1.0,
            child: CarouselSlider(
              enlargeCenterPage: true,
              onPageChanged: (index) =>
                  carouselIndicatorProvider.setCurrentIndex(index),
              viewportFraction: 0.9,
              height: MediaQuery.of(context).size.width * 0.95,
              items: LinkState.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return CardFrameWidget(
                      cardWidth: MediaQuery.of(context).size.width * 0.89,
                      cardHeight: MediaQuery.of(context).size.width * 0.95,
                      marginRight: 20,
                      paddingTop: 20.0,
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: i
                            .map(
                              (element) => Center(
                                child: CircleIconAvatarWidget(
                                  size:
                                      MediaQuery.of(context).size.width * 0.165,
                                  backgroundColor: element["color"],
                                  isTitleRequire: true,
                                  title: element["title"],
                                  icon: element["icon"],
                                  stackButtonPositionRight: 0.0,
                                  onTapFunction: () => _launchURL(
                                    element['url'],
                                  ),
                                  opLongPressFunction: () {
                                    _quickLinkControllerProvider
                                        .getQuickLinks()
                                        .add(element['title']);
                                    _quickLinkControllerProvider
                                        .setQuickLinkSave();
                                    print(_quickLinkControllerProvider.getQuickLinks());
                                    _quickLinkControllerProvider.saveList();
                                  },
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
