import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/providers/provider_club-search-option.dart';
import 'package:cuk/widgets/widget_decorated-drop-down-menu.dart';
import 'package:cuk/widgets/widget_flat-button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlertDialogPage extends StatefulWidget {
  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  ClubSearchOption _clubSearchOption;

  @override
  Widget build(BuildContext context) {
    _clubSearchOption = Provider.of<ClubSearchOption>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 32.0),
          Text(
            "포스터 정렬",
            style: TextStyle(
              fontFamily: "NanumSquareExtraBold",
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
      content: SizedBox(
        height: MediaQuery.of(context).size.width * 0.7,
        width: MediaQuery.of(context).size.width * 0.65,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "교정",
                  style: TextStyle(
                    color: Color(0XFF888888),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              DecoratedDropDownMenuWidget(
                dropBoxButtonWidget: DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                      value: "성심교정",
                      child: Container(
                        child: Text(
                          "성심교정",
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) => _clubSearchOption.setValueSchool(value),
                  value: _clubSearchOption.getValueSchool(),
                  style: TextStyle(
                      fontSize:
                          SizeConverterFunction(context: context, size: 20.0),
                      color: Color(0XFFFFBB00),
                      fontWeight: FontWeight.w600),
                  underline: Container(),
                  isExpanded: true,
                  iconSize: SizeConverterFunction(context: context, size: 30.0),
                ),
              ),
              SizedBox(height: SizeConverterFunction(context: context, size: 10.0)),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "기간",
                  style: TextStyle(
                    color: Color(0XFF888888),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              DecoratedDropDownMenuWidget(
                dropBoxButtonWidget: DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                      value: "2019",
                      child: Container(
                        child: Text(
                          "2019",
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "2020",
                      child: Container(
                        child: Text(
                          "2020",
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) => _clubSearchOption.setValueYear(value),
                  value: _clubSearchOption.getValueYear(),
                  style: TextStyle(
                      fontSize:
                          SizeConverterFunction(context: context, size: 20.0),
                      color: Color(0XFFFFBB00),
                      fontWeight: FontWeight.w600),
                  underline: Container(),
                  isExpanded: true,
                  iconSize: SizeConverterFunction(context: context, size: 30.0),
                ),
              ),
              SizedBox(height: SizeConverterFunction(context: context, size: 25.0)),
              InkWell(
                onTap: (){
                  _clubSearchOption.setIsValueYear2020();
                  Navigator.pop(context);
                },
                child: FlatButtonWidget(
                  flatButtonHeight:
                      SizeConverterFunction(context: context, size: 40.0),
                  flatButtonWidth:
                      SizeConverterFunction(context: context, size: 262.0),
                  title: "적용하기",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
