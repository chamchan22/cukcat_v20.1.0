import 'package:cuk/functions/function_size-converter.dart';
import 'package:cuk/providers/provider_timer-setting.dart';
import 'package:cuk/widgets/widget_flat-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

class TimerSettingPage extends StatefulWidget {
  @override
  _TimerSettingPageState createState() => _TimerSettingPageState();
}

class _TimerSettingPageState extends State<TimerSettingPage> {
  TimerSettingProvider _timerSettingProvider;

  @override
  Widget build(BuildContext context) {
    _timerSettingProvider = Provider.of<TimerSettingProvider>(context);
    String _startDate = _timerSettingProvider.getStartDateToString();
    String _endDate = _timerSettingProvider.getEndDateToString();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.settings,
                size: SizeConverterFunction(context: context, size: 15.0),
                color: Color(0XFF005EEC),
              ),
              Text(
                " Timer Setting",
                style: TextStyle(
                  color: Color(0XFF005EEC),
                  fontSize: SizeConverterFunction(context: context, size: 15.0),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "시작일",
              style: TextStyle(
                color: Color(0XFF4C7DE1),
                fontSize: SizeConverterFunction(
                  context: context,
                  size: 15.0,
                ),
                fontWeight: FontWeight.w900,
              ),
            ),
            InkWell(
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  onConfirm: (date) {
                    if (_timerSettingProvider.getEndDate().isAfter(date)) {
                      _timerSettingProvider.setStartDate(date);
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('종료일보다 클 수 없어요.'),
                        ),
                      );
                    }
                  },
                  currentTime: _timerSettingProvider.getNowDate(),
                  locale: LocaleType.ko,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0XFFB6CAF2),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        size: SizeConverterFunction(
                          context: context,
                          size: 15.0,
                        ),
                        color: Color(0XFF4C7DE1),
                      ),
                      Text(
                        _startDate,
                        style: TextStyle(
                          color: Color(0XFF4C7DE1),
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConverterFunction(
                            context: context,
                            size: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "종료일",
              style: TextStyle(
                color: Color(0XFF4C7DE1),
                fontSize: SizeConverterFunction(
                  context: context,
                  size: 15.0,
                ),
                fontWeight: FontWeight.w900,
              ),
            ),
            InkWell(
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  onConfirm: (date) {
                    if (_timerSettingProvider.getStartDate().isBefore(date)) {
                      _timerSettingProvider.setEndDate(date);
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('시작일보다 작을 수 없어요.'),
                        ),
                      );
                    }
                  },
                  currentTime: _timerSettingProvider.getNowDate(),
                  locale: LocaleType.ko,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0XFFB6CAF2),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        size: SizeConverterFunction(
                          context: context,
                          size: 15.0,
                        ),
                        color: Color(0XFF4C7DE1),
                      ),
                      Text(
                        _endDate,
                        style: TextStyle(
                          color: Color(0XFF4C7DE1),
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConverterFunction(
                            context: context,
                            size: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            _timerSettingProvider.setTimerPrefs();
          },
          child: FlatButtonWidget(
            flatButtonHeight:  SizeConverterFunction(context: context, size: 39.0),
            flatButtonWidth: SizeConverterFunction(context: context, size: 259.0),
            title: "적용하기",
          ),
        )
      ],
    );
  }
}
