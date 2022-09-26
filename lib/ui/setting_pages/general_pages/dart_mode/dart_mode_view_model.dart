import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/ui/base/base_view_model.dart';

class DartModeViewViewModel extends BaseViewModel {
  DartModeViewViewModel(Reader reader) : super(reader) {
    init();
  }
  bool isAutoMaticActive = false;
  bool isDarkModeActive = false;

  AsyncValue<bool> response = const AsyncLoading();
  // Enum inforProfile = InformationProfileType.FIRSTNAME;

  init() {}

  onChangedAutoMatic(bool b) async {
    await sharedPref.saveThemeAuto(b);
    isAutoMaticActive = b;
    notifyListeners();
  }

  onChangedDarkMode(bool b) async {
    await sharedPref.saveTheme(b);
    isDarkModeActive = b;
    notifyListeners();
  }
}
