import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/pages/page_notice-list.dart';
import 'package:cuk/providers/provider_notice-selector.dart';
import 'package:cuk/widgets/widget_circle-icon-avatar.dart';
import 'package:cuk/widgets/widget_decorated-drop-down-menu.dart';
import 'package:cuk/widgets/widget_horizontal-line.dart';
import 'package:cuk/widgets/widget_notice-item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeScreen extends StatefulWidget {
  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  NoticeSelectorProvider _noticeSelectorProvider;
  List _noticeList = [];
  String _collectionId = DateFormat("yyyy-MM-dd")
      .format(DateTime.now().add(new Duration(hours: 9)))
      .toString()
      .substring(0, 7);
  List _collectionIdList = [
    "2020-02",
    "2020-03",
    "2020-04",
    "2020-05",
    "2020-06",
    "2020-07",
    "2020-08"
  ];

  Future getNoticeList(String collectionId) async {
    List _list = [];
    await Firestore.instance
        .collection("notices/main-notices/$collectionId")
        .getDocuments()
        .then((QuerySnapshot value) {
      _list = value.documents
          .map((DocumentSnapshot docSnapshot) => docSnapshot.data)
          .toList();
    });
    setState(() {
      _noticeList = _list;
    });
  }

  setCollectionIdList() {
    int _now = DateTime.now().add(Duration(hours: 9)).month;
    _collectionIdList.removeRange(_now - 1, _collectionIdList.length);
  }

  @override
  void initState() {
    getNoticeList(_collectionId);
    setCollectionIdList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var nowDate = DateTime.now().add(new Duration(hours: 9));

    _noticeSelectorProvider = Provider.of<NoticeSelectorProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: SizeConverterFunction(context: context, size: 55.0),
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizeConverterFunction(context: context, size: 20.0),
                  right: SizeConverterFunction(context: context, size: 20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          size: SizeConverterFunction(
                            context: context,
                            size: 26.0,
                          ),
                          color: Color(0XFFFFB549),
                        ),
                        SizedBox(width: 5.0),
                        InkWell(
                          onTap: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: 100,
                                    height: 400,
                                    color: Colors.white,
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "월 선택",
                                              style: TextStyle(
                                                fontFamily:
                                                    "NanumSquareExtraBold",
                                                fontSize: 20.0,
                                                color: Color(0XFF738AFF),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
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
                                        SizedBox(height: 10.0),
                                        Container(
                                          height: 360,
                                          child: ListView(
                                            children: _collectionIdList
                                                .map(
                                                  (id) => InkWell(
                                                    onTap: () {
                                                      _collectionId = id;
                                                      getNoticeList(
                                                          _collectionId);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Card(
                                                        child: Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              "${id.toString().substring(0, 4)} 년 ${id.toString().substring(5, 7)} 월 공지",
                                                              style: TextStyle(
                                                                fontSize: 20.0,
                                                                color: Color(
                                                                  0XFF8B8B8B,
                                                                ),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          child: Text(
                            "$_collectionId 공지사항",
                            style: TextStyle(
                              fontSize: SizeConverterFunction(
                                context: context,
                                size: 18.0,
                              ),
                              color: Color(0XFF7F7F7F),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Color(0XFFB7B7B7),
                        )
                      ],
                    ),
                    SizedBox(height: 5.0),
                    HorizontalLineWidget(
                      lineColor: Color(0XFFDEDEDE),
                      lineHeight: 3.0,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ListView(
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
                            noticeItemHeight: SizeConverterFunction(
                                context: context, size: 65.0),
                            circleIconAvatarWidget: CircleIconAvatarWidget(
                              size: SizeConverterFunction(
                                  context: context, size: 63.0),
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
                            centerPadding: SizeConverterFunction(
                                context: context, size: 15.0)),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
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
