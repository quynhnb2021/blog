import 'package:blog/ui/base/hook/use_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/ui/themes/text_styles.dart';

class AppBarCustom extends HookConsumerWidget implements PreferredSizeWidget {
  AppBarCustom({
    Key? key,
    this.contentLeading,
    this.showBack = true,
    this.onBackPress,
    this.height,
    this.backIcon,
    this.title,
    this.colorBg,
    this.titleCenterTop,
    this.titleCenterBottom,
    this.showTitleCenter = true,
    this.onRightPress,
    this.rightIcon,
  })  : preferredSize = Size.fromHeight(height ?? 70),
        super(key: key);
  final double? height;
  final String? contentLeading;
  final bool showBack;
  final VoidCallback? onBackPress;
  final String? backIcon;
  final bool showTitleCenter;
  final String? titleCenterTop;
  final String? titleCenterBottom;
  final Widget? title;
  final Color? colorBg;
  final VoidCallback? onRightPress;
  final Widget? rightIcon;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    return AppBar(
        leadingWidth: 100,
        centerTitle: true,
        leading: showBack
            ? GestureDetector(
                onTap: onBackPress ??
                    () {
                      router.pop();
                    },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    const Icon(Icons.arrow_back),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      contentLeading ?? "Back",
                      style: TextStyles.regularText14.colorPrimaryOrange,
                    )
                  ],
                ),
              )
            : const Offstage(),
        backgroundColor: colorBg,
        elevation: 0,
        title: title ??
            (showTitleCenter
                ? Column(
                    children: [
                      Text(titleCenterTop ?? '',
                          style: TextStyles.boldText16.colorPrimaryBlack),
                      titleCenterBottom != null
                          ? Text(titleCenterBottom!,
                              style: TextStyles.regularText12.colorPrimaryGray)
                          : const Offstage(),
                    ],
                  )
                : const Offstage()),
        actions: [
          GestureDetector(
            onTap: onRightPress,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              child: rightIcon,
            ),
          ),
        ]);
  }
}
