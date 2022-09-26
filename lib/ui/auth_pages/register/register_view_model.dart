import 'dart:async';

import 'package:blog/ui/base/hook/use_router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/data/model/remote/response/blog_response.dart';
import 'package:blog/ui/base/base_view_model.dart';

const isFistLogin = 1;

class RegisterViewModel extends BaseViewModel {
  RegisterViewModel(Reader reader) : super(reader);
  tapRegister(String mail, String pw, BuildContext context) async {
    setBusy(true);
    await appApiHelper.registerUsingEmailPassword(mail, pw, context, (data) {
      print(data);
      setBusy(false);
      Fluttertoast.showToast(msg: 'Register member successfully');
      Navigator.of(context).pop();
    });
    setBusy(false);
  }
}
