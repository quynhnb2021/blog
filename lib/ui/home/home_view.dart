import 'package:blog/ui/base/hook/use_effect_async.dart';
import 'package:blog/ui/blog/blog_view.dart';
import 'package:blog/ui/create_blog/create_blog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/di/view_model_provider.dart';
import 'package:blog/ui/base/base_view.dart';
import 'package:blog/ui/home/home_view_model.dart';
import 'package:blog/ui/home/tab_type.dart';
import 'package:blog/ui/setting_pages/setting/setting_view.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/text_styles.dart';

class HomeView extends BaseView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeViewModel viewModel = ref.watch(homeViewModelProvider);
    final idMain = useState(viewModel.bottomSelectedItem);

    useEffectAsync(() async {
      print("Inited");
      // await viewModel.configureOneSignal();
    });

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: [
          // const OverviewView(),
          // const FleetView(),
          const BlogView(),
          const CreateBlogView(),

          const SettingView(),
        ][idMain.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: idMain.value,
          onTap: (index) {
            idMain.value = index;
          },
          selectedItemColor: AppColors.colorOrange,
          unselectedItemColor: AppColors.colorDivider,
          selectedLabelStyle: TextStyles.regularText12.w500.colorPrimaryOrange,
          unselectedLabelStyle: TextStyles.regularText12.w500,
          type: BottomNavigationBarType.fixed,
          items: TabType.values
              .map(
                (type) => _bottomNavigationBarItem(
                  icon: mapTabTypeToIconUri(type),
                  label: mapTabTypeToLabel(type),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required Widget icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: icon,
      activeIcon: icon,
      label: label,
    );
  }
}
