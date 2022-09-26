import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/data/model/remote/response/display_profile_response.dart';
import 'package:blog/ui/base/base_view_model.dart';

class AboutViewModel extends BaseViewModel {
  AboutViewModel(Reader reader) : super(reader) {
    // onInit();
  }

  // onInit() {
  //   getInforAbout();
  // }

  // Future<DisplayAboutResponse?> getInforAbout() async {
  //   setBusy(true);
  //   final result = await appApiHelper.getAbout("FleetMaster", "1.0.0");

  //   if (result.isSuccess) {
  //     about = result.dataOrThrow.data!;
  //     setBusy(false);
  //     return about;
  //   } else {
  //     setBusy(false);
  //     return null;
  //   }
  // }
}
