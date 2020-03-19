import 'package:flutter/material.dart';

void AlertDialogFunction(
    BuildContext context,
    AlertDialog alertDialog,
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}
