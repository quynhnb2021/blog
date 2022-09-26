import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/text_styles.dart';

class Button extends HookConsumerWidget {
  const Button(
      {required this.onPress,
      this.enable = true,
      required this.title,
      this.bgColor,
      this.titleColor,
      this.width,
      this.height,
      Key? key})
      : super(key: key);
  final VoidCallback onPress;
  final double? width, height;
  final bool enable;
  final String title;
  final Color? bgColor;
  final Color? titleColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDisable = useState(false);
    final double buttonHeight = height ?? 48;
    return GestureDetector(
      onTap: enable
          ? () {
              if (!isDisable.value) {
                onPress();
                isDisable.value = true;
              }
            }
          : null,
      child: AnimatedOpacity(
        opacity: isDisable.value ? 0.4 : 1,
        duration: const Duration(milliseconds: 500),
        onEnd: () {
          isDisable.value = false;
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: buttonHeight,
              maxHeight: buttonHeight),
          child: Container(
            decoration: BoxDecoration(
                color: (bgColor ?? AppColors.backgroundColorButton)
                    .withOpacity(enable ? 1 : 0.3),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(title,
                  style: TextStyles.boldText16.copyWith(
                      color: titleColor ?? AppColors.backgroundDarkMode)),
            ),
          ),
        ),
      ),
    );
  }
}
