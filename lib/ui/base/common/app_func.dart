import 'package:blog/ui/base/component/notice_popup/notice_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppFunc {
  static void hideKeyboard(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void showBottomDialog(BuildContext context, Widget child) {
    // DateTime dateChanged = DateTime(2016, 10, 26);
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 270,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(top: false, child: child),
            ));
  }

  fullStringTimeFormat(String? stringTime) {
    final date = DateTime.tryParse(stringTime ?? '');
    return date != null ? DateFormat('dd/MM/yyyy').format(date) : '';
  }

  static showAlertDialog(BuildContext context,
      {String? message, String? title}) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title ?? "Notification"),
      content: Text(message ?? ''),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showSuccessDialog(
    BuildContext context,
    String title,
    String content,
    bool isSuccess,
    VoidCallback onDismiss,
  ) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => NoticePopup(
              title: title,
              content: content,
              onTouchOK: () {
                Navigator.of(context).pop();
              },
              isSuccessAlert: isSuccess,
            )).whenComplete(() {
      onDismiss();
    });
  }
}
