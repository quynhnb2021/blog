import 'package:blog/ui/base/hook/use_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/text_styles.dart';

class AlertPopup extends HookConsumerWidget {
  const AlertPopup({
    Key? key,
    this.title,
    this.content,
    this.titleBtnRight,
    this.colorBtnRight,
    this.onTouchOK,
  }) : super(key: key);

  final String? title, content, titleBtnRight;
  final VoidCallback? onTouchOK;
  final Color? colorBtnRight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
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
              GestureDetector(
                onTap: router.pop,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: colorBtnRight ?? AppColors.backgroundColorButton,
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(titleBtnRight ?? 'OK',
                        style: TextStyles.boldText16.colorPrimaryBlack),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
