import 'package:blog/route/app_route.gr.dart';
import 'package:blog/ui/base/common/app_func.dart';
import 'package:blog/ui/base/component/app_bar_custom/app_bar_custom.dart';
import 'package:blog/ui/base/component/button/button.dart';
import 'package:blog/ui/base/component/loading/container_with_loading.dart';
import 'package:blog/ui/base/hook/use_effect_async.dart';
import 'package:blog/ui/base/hook/use_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/di/view_model_provider.dart';
import 'package:blog/ui/base/base_view.dart';
import 'package:blog/ui/setting_pages/setting/setting_view_model.dart';
import 'package:blog/ui/setting_pages/setting/views/custom_item_setting.dart';

class SettingView extends BaseView<SettingViewModel> {
  // DisplayProfileResponse inforProfile;
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final SettingViewModel viewModel = ref.watch(settingViewModelProvider);
    useEffectAsync(() async {
      print("getInforProfile");
      await viewModel.getUserInfor();
    });

    Future<void> onLogout() async {
      // await viewModel.tapLogout(() async {
      //   await viewModel.sharedPref.clearAllInfor();
      //   router.pushAndPopUntil(
      //     const LoginRoute(),
      //     predicate: (Route<dynamic> router) {
      //       return router.settings.name == LoginRoute.name;
      //     },
      //   );
      // });
      await viewModel.sharedPref.clearAllInfor();
      router.pushAndPopUntil(
        const LoginRoute(),
        predicate: (Route<dynamic> router) {
          return router.settings.name == LoginRoute.name;
        },
      );
    }

    return Scaffold(
      appBar: AppBarCustom(
        height: 0,
      ),
      body: SafeArea(
        child: ContainerWithLoading(
          provider: settingViewModelProvider,
          child: GestureDetector(
            onTap: (() => AppFunc.hideKeyboard(context)),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
              child: Column(
                children: [
                  CustomItemSetting(
                    margin: EdgeInsets.only(top: 100, left: 24, right: 24),
                    icon: const Icon(
                      Icons.assignment_ind,
                      size: 28,
                    ),
                    title: "User: ",
                    value: viewModel.mail,
                    onTap: () {},
                  ),
                  // CustomItemSetting(
                  //   icon: const Icon(
                  //     Icons.mode,
                  //     size: 28,
                  //   ),
                  //   title: "General",
                  //   onTap: () {
                  //     router.navigate(const GeneralRoute());
                  //   },
                  // ),
                  const CustomItemSetting(
                    icon: Icon(
                      Icons.info,
                      size: 28,
                    ),
                    title: "Version ",
                    value: '1.0.0',
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Dark Mode',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CupertinoSwitch(
                              value: viewModel.isDarkModeActive,
                              onChanged: (value) {
                                viewModel.onChangedDarkMode(value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 24.0),
                    child: Button(
                      title: "Logout",
                      onPress: onLogout,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildHeader(BuildContext context) => Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.only(top: 43, left: 24, right: 24, bottom: 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Setting",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          // SearchView(
          //   onActionDone: (s) {
          //     print(s);
          //   },
          // ),
        ]),
      );
  // buildProfile(StackRouter router, SettingViewModel viewModel,
  //         BuildContext context) =>
  //     CustomContainer(
  //       padding: const EdgeInsets.all(16),
  //       margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  //       child: InkWell(
  //         onTap: () {
  //           if (viewModel.profile == null) {
  //             return;
  //           }
  //           router.navigate(ProfileRoute(
  //               inforProfile:
  //                   viewModel.profile ?? const DisplayProfileResponse()));
  //         },
  //         child: ListTile(
  //           contentPadding: EdgeInsets.zero,
  //           visualDensity: const VisualDensity(horizontal: 0, vertical: 4),
  //           leading: ClipRRect(
  //             borderRadius: BorderRadius.circular(32),
  //             child: CustomNetworkImage(
  //               image: viewModel.profile?.profilePhotoPath,
  //               width: 64,
  //               height: 64,
  //             ),
  //           ),
  //           title: Text(
  //               '${viewModel.profile?.userFirstName ?? ''} ${viewModel.profile?.userLastName ?? ''}',
  //               style: Theme.of(context).textTheme.titleLarge),
  //           subtitle: Text(
  //             "Avatar, UID, Name, Email,\nPhone number, Change password",
  //             style: Theme.of(context).textTheme.labelMedium,
  //           ),
  //           trailing: Icon(
  //             Icons.navigate_next,
  //             color: AppColors.contentPlaceholder,
  //           ),
  //         ),
  //       ),
  //     );

}
