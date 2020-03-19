import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/providers/provider_notice-selector.dart';
import 'package:cuk/widgets/widget_circle-icon-avatar.dart';
import 'package:cuk/widgets/widget_notice-item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeListPage extends StatefulWidget {
  @override
  _NoticeListPageState createState() => _NoticeListPageState();
}

class _NoticeListPageState extends State<NoticeListPage> {
  NoticeSelectorProvider _noticeSelectorProvider;
  List _noticeList = [];

  Future getNoticeList(String collectionId) async {
    await Firestore.instance
        .collection("notices/main-notices/$collectionId")
        .getDocuments()
        .then((QuerySnapshot value) {
      _noticeList = value.documents
          .map((DocumentSnapshot docSnapshot) => docSnapshot.data)
          .toList();
    });
    return _noticeList;
  }

  @override
  void initState() {
    // TODO: implement initState
    getNoticeList("2020-02");
    print(_noticeList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _noticeSelectorProvider = Provider.of<NoticeSelectorProvider>(context);
    print("11 : $_noticeList");
    return ListView(
      children: _noticeList
          .map(
            (element) => InkWell(
              onTap: () => _launchURL(element['url']),
              child: NoticeItemWidget(
                  noticeType: element['boardTitle'],
                  noticeCreatedTime: DateFormat('yyyy-MM-dd')
                      .format(
                        DateTime.fromMillisecondsSinceEpoch(
                          element['writtenAt'].seconds * 1000,
                        ),
                      )
                      .toString(),
                  noticeTitle: element['title'],
                  noticeItemHeight:
                      SizeConverterFunction(context: context, size: 65.0),
                  circleIconAvatarWidget: CircleIconAvatarWidget(
                    size: SizeConverterFunction(context: context, size: 63.0),
                    backgroundColor: Color(0XFFDEDEDE),
                    isTitleRequire: false,
                    borderWidth: 3.5,
                    borderColor: Color(0XFF707070),
                    icon: Icons.volume_up,
                    iconColor: Color(0XFF707070),
                  ),
                  noticeTitleTextSize:
                      SizeConverterFunction(context: context, size: 14.0),
                  noticeCreatedTimeTextSize:
                      SizeConverterFunction(context: context, size: 10.0),
                  noticeTypeTextSize:
                      SizeConverterFunction(context: context, size: 15.0),
                  centerPadding:
                      SizeConverterFunction(context: context, size: 15.0)),
            ),
          )
          .toList(),
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

/*
NoticeItemWidget(
            noticeItemHeight: SizeConverterFunction(
                context: context, size: 65.0),
            circleIconAvatarWidget: CircleIconAvatarWidget(
              size: SizeConverterFunction(context: context, size: 65.0),
              backgroundColor: Color(0XFFDEDEDE),
              isTitleRequire: false,
              borderWidth: 3.5,
              borderColor: Color(0XFF707070),
              icon: Icons.volume_up,
              iconColor: Color(0XFF707070),
            ),
            noticeTitleTextSize: SizeConverterFunction(
                context: context, size: 14.0),
            noticeCreatedTimeTextSize: SizeConverterFunction(
                context: context, size: 10.0),
            noticeTypeTextSize: SizeConverterFunction(
                context: context, size: 15.0),
            centerPadding: SizeConverterFunction(context: context, size: 15.0)
        ),
 */
