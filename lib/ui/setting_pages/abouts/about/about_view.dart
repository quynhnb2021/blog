import 'package:blog/ui/base/component/app_bar_custom/app_bar_custom.dart';
import 'package:blog/ui/base/component/loading/container_with_loading.dart';
import 'package:blog/ui/base/hook/use_localizations.dart';
import 'package:blog/ui/base/hook/use_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/di/view_model_provider.dart';
import 'package:blog/ui/base/base_view.dart';
import 'package:blog/ui/setting_pages/abouts/about/about_view_model.dart';
import 'package:blog/ui/setting_pages/setting/views/custom_item_setting.dart';

class AboutView extends BaseView<AboutViewModel> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final AboutViewModel viewModel = ref.watch(aboutViewModelProvider);
    return Scaffold(
      appBar: AppBarCustom(
        title: Text("ABout"),
      ),
      body: ContainerWithLoading(
        provider: settingViewModelProvider,
        child: ListView(
          children: [
            // CustomItemSetting(
            //   title: "Version",
            //   value: viewModel.about?.versionNumber ?? '',
            // ),
          ],
        ),
      ),
    );
  }
}
