import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/ui/base/base_view_model.dart';

class SettingViewModel extends BaseViewModel {
  SettingViewModel(Reader reader) : super(reader) {
    getUserInfor();
  }

  String mail = '';
  bool isDarkModeActive = false;

  onChangedDarkMode(bool b) async {
    await sharedPref.saveTheme(b);
    isDarkModeActive = b;
    notifyListeners();
  }

  getUserInfor() async {
    final data = await sharedPref.getMail();
    mail = data;
  }

  tapLogout(Function callback) async {
    await appApiHelper.signOut((data) {
      callback.call(data);
    });
  }
}
