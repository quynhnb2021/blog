import 'package:blog/ui/base/component/app_bar_custom/app_bar_custom.dart';
import 'package:blog/ui/base/hook/use_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/di/view_model_provider.dart';
import 'package:blog/ui/base/base_view.dart';
import 'package:blog/ui/setting_pages/general_pages/dart_mode/dart_mode_view_model.dart';
import 'package:blog/ui/setting_pages/setting/views/custom_item_setting.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/text_styles.dart';

// enum ThemeMode {
//   system,
//   light,
//   dark,
// }

class DartModeView extends BaseView<DartModeViewViewModel> {
  const DartModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = useRouter();
    // var themeMode = ref.watch(themeModeProvider);
    final DartModeViewViewModel viewModel =
        ref.watch(dartModeViewModelProvider);
    final TextEditingController textEditController = useTextEditingController();
    return Scaffold(
      appBar: AppBarCustom(
        title: const Text(
          "Dart Mode",
        ),
      ),
      body: ListView(
        children: [
          CustomItemSetting(
            child: Column(children: [
              buildItem("Automatic", () {}, context, (value) {
                viewModel.onChangedAutoMatic(value);
              }, viewModel.isAutoMaticActive),
              Visibility(
                visible: !viewModel.isAutoMaticActive,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: AppColors.colorDivider,
                    height: 1,
                  ),
                ),
              ),
              Visibility(
                visible: !viewModel.isAutoMaticActive,
                child: buildItem("Darkmodel", () {}, context, (value) {
                  viewModel.onChangedDarkMode(value);
                }, viewModel.isDarkModeActive),
              )
            ]),
          ),
        ],
      ),
    );
  }

  buildItem(String subTitle, Function()? onTap, BuildContext context,
          Function(bool value) action, bool active) =>
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      subTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CupertinoSwitch(
                          value: active,
                          onChanged: (value) {
                            action(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
