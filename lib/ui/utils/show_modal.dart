import 'package:blog/ui/base/component/confirm_popup/confirm_popup.dart';
import 'package:blog/ui/base/component/notice_popup/notice_popup.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:flutter/material.dart';

class ShowModal {
  static void showNoticeDialog(
      {String? title,
      String? content,
      bool isSuccess = false,
      required BuildContext context,
      bool isLoadingPopup = false,
      bool barrierDismissible = false,
      VoidCallback? onTouch}) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (_) => NoticePopup(
              title: title,
              isLoadingPopup: isLoadingPopup,
              content: content,
              onTouchOK: onTouch,
              isSuccessAlert: isSuccess,
            ));
  }

  static void showConfirmDialog(
      {String? title,
      String? content,
      bool barrierDismissible = false,
      String? titleBtnRight,
      required BuildContext context,
      VoidCallback? onTouch}) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (_) => ConfirmPopup(
            title: title,
            content: content,
            titleBtnRight: titleBtnRight ?? "Detele",
            colorBtnRight: AppColors.redNotificationColor,
            titleRightColor: AppColors.textThemeDarkColor,
            onTouchOK: onTouch));
  }
}
