import 'package:blog/ui/base/hook/use_localizations.dart';
import 'package:blog/ui/base/hook/use_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/text_styles.dart';

class ConfirmPopup extends HookConsumerWidget {
  const ConfirmPopup(
      {Key? key,
      this.title,
      this.content,
      this.onTouchOK,
      this.titleBtnRight,
      this.colorBtnRight,
      this.titleRightColor})
      : super(key: key);

  final String? title, content, titleBtnRight;
  final VoidCallback? onTouchOK;
  final Color? colorBtnRight, titleRightColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    // final trans = useLocalizations();
    return Dialog(
        backgroundColor: AppColors.textThemeDarkColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetAnimationCurve: Curves.slowMiddle,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title ?? "Title Popup",
                textAlign: TextAlign.center,
                style: TextStyles.regularText16.w600.copyWith(
                  color: AppColors.textThemeLightColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                content ?? 'Content Popup',
                textAlign: TextAlign.center,
                style: TextStyles.regularText16.copyWith(
                  color: AppColors.textThemeLightColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: router.pop,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text("Cancel",
                              style: TextStyles.boldText16.colorPrimaryBlack),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: onTouchOK,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: colorBtnRight ??
                                AppColors.backgroundColorButton,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(titleBtnRight ?? "Yes",
                              style: TextStyles.boldText16.copyWith(
                                  color: titleRightColor ??
                                      AppColors.backgroundDarkMode)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // )
            ],
          ),
        ));
  }
}
