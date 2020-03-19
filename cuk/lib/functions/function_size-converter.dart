import 'package:flutter/material.dart';

double SizeConverterFunction({
  @required BuildContext context,
  @required double size,
}) {
  return MediaQuery.of(context).size.width * (size / 375);
}
