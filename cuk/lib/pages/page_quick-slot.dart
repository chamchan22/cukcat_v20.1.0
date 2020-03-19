import 'package:cuk/providers/provider_quick-link-controller.dart';
import 'package:cuk/states/state_link.dart';
import 'package:cuk/widgets/widget_circle-icon-avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickSlotPage extends StatefulWidget {
  QuickSlotPage({Key key, @required this.isStackButtonRequire})
      : super(key: key);

  bool isStackButtonRequire;

  @override
  _QuickSlotPageState createState() => _QuickSlotPageState();
}

class _QuickSlotPageState extends State<QuickSlotPage> {
  SharedPreferences prefs;
  QuickLinkControllerProvider _quickLinkControllerProvider;

  @override
  Widget build(BuildContext context) {
    _quickLinkControllerProvider =
        Provider.of<QuickLinkControllerProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.width * 0.3,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: _quickLinkControllerProvider.getQuickLinkSave().map<Widget>(
          (element) {
            int _countValueIndex = _quickLinkControllerProvider
                .getQuickLinkSave()
                .indexOf(element);
            return CircleIconAvatarWidget(
              size: MediaQuery.of(context).size.width * 0.14,
              isStackButtonRequire: widget.isStackButtonRequire ?? false,
              isTitleRequire: true,
              backgroundColor: element["color"],
              icon: element["icon"],
              title: element["title"],
              paddingRight: 15,
              paddingLeft: 15,
              paddingTop: 20,
              stackButtonPositionTop: 15.0,
              stackButtonPositionRight: 10.0,
              onTapStackButtonFunction: () => _quickLinkControllerProvider
                  .setQuickLinkDelete(_countValueIndex),
              stackButtonIcon: Icons.close,
              onTapFunction: () => !widget.isStackButtonRequire
                  ? _launchURL(element['url'])
                  : null,
            );
          },
        ).toList(),
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
