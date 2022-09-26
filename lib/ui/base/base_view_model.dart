import 'package:blog/data/repository/firebase_manage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/data/model/local/app_preferences_helper.dart';
import 'package:blog/di/repository_provider.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BaseViewModel(this._reader);

  final Reader _reader;

  Reader get reader => _reader;

  late final FirebaseHelper _appApiHelper = reader(firebaseManageProvider);

  FirebaseHelper get appApiHelper => _appApiHelper;

  late final AppPreferencesHelper _sharedPref = reader(sharedPrefProvider);

  AppPreferencesHelper get sharedPref => _sharedPref;

  bool _isBusy = false;

  bool get isBusy => _isBusy;

  bool _isError = false;

  bool get isError => _isError;

  void setBusy(bool state) {
    _isBusy = state;
    notifyListeners();
  }

  void setError(bool state) {
    _isError = state;
    notifyListeners();
  }

  void updateWidget() {
    notifyListeners();
  }
}
