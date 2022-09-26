import 'package:blog/ui/base/hook/use_effect_async.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/data/model/local/app_preferences_helper.dart';
import 'package:blog/di/view_model_provider.dart';
import 'package:blog/ui/setting_pages/general_pages/dart_mode/dart_mode_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomContainer extends HookConsumerWidget {
  const CustomContainer(
      {Key? key,
      this.child,
      this.color,
      this.padding,
      this.margin,
      this.radius,
      this.width,
      this.height,
      this.boxShadow})
      : super(key: key);
  final Widget? child;
  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? radius;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DartModeViewViewModel viewModel =
        ref.watch(dartModeViewModelProvider);
    Future<void> getTheme() async {
      final prefs = await SharedPreferences.getInstance();
      final isDarkMode = prefs.getBool(prefThemeDark) ?? false;
      viewModel.onChangedDarkMode(isDarkMode);
      // final isAuto = prefs.getBool(prefThemeDark) ?? false;
      // viewModel.onChangedAutoMatic(isAuto);
    }

    useEffectAsync(() async {
      getTheme();
    });
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.zero,
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 12),
          ),
          boxShadow: boxShadow ?? []),
      child: child ?? const SizedBox(),
    );
  }
}

class CustomBorderContainer extends StatelessWidget {
  const CustomBorderContainer(
      {Key? key,
      this.child,
      this.color,
      this.colorBorder,
      this.padding,
      this.margin,
      this.callBack,
      this.radius,
      this.width,
      this.height,
      this.boxShadow})
      : super(key: key);
  final Widget? child;
  final Color? color;
  final Color? colorBorder;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? callBack;
  final double? radius;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? EdgeInsets.zero,
        margin: margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 12),
            ),
            border: Border.all(width: 1, color: Theme.of(context).hintColor),
            boxShadow: boxShadow ?? []),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
