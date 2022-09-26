import 'package:blog/ui/base/component/button/button.dart';
import 'package:blog/ui/base/hook/use_localizations.dart';
import 'package:blog/ui/base/hook/use_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/text_styles.dart';

class NoticePopup extends HookConsumerWidget {
  const NoticePopup({
    Key? key,
    this.title,
    this.content,
    this.isSuccessAlert = false,
    this.isLoadingPopup = false,
    this.onTouchOK,
  }) : super(key: key);

  final String? title, content;
  final bool isSuccessAlert;
  final bool isLoadingPopup;
  final VoidCallback? onTouchOK;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    // final trans = useLocalizations();

    AssetImage image = const AssetImage("assets/icons/login/loading.gif");
    useEffect(() {
      return () {
        image.evict();
      };
    }, []);
    return Dialog(
        backgroundColor: AppColors.textThemeDarkColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetAnimationCurve: Curves.slowMiddle,
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(minWidth: double.infinity, minHeight: 100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 32),
            child: isLoadingPopup
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: image,
                          width: 93,
                          height: 98,
                        ),
                        Text(
                          "Loading ...",
                          textAlign: TextAlign.center,
                          style: TextStyles.regularText14.colorPrimaryGray,
                        ),
                      ],
                    ),
                  )
                : Column(
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
                      Image.asset(
                        "assets/icons/notice_popup/ic_${isSuccessAlert ? "success" : "error"}.png",
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        content ?? 'Message Popup',
                        textAlign: TextAlign.center,
                        style: TextStyles.regularText16.copyWith(
                          color: AppColors.textThemeLightColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Button(
                        onPress: onTouchOK ??
                            () {
                              router.pop();
                            },
                        title: "Ok",
                        height: 40,
                      ),
                    ],
                  ),
          ),
        ));
  }
}
