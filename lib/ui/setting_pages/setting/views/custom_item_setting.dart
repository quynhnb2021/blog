import 'package:flutter/material.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/app_style.dart';
import 'package:blog/ui/themes/custom_container.dart';
import 'package:blog/ui/themes/text_styles.dart';

class CustomItemSetting extends StatelessWidget {
  const CustomItemSetting(
      {this.title,
      this.height,
      this.subTitle,
      this.value,
      this.onTap,
      this.style,
      this.styleValue,
      this.child,
      this.icon,
      this.margin,
      Key? key})
      : super(key: key);
  final String? title;
  final double? height;
  final String? subTitle;
  final String? value;
  final Function()? onTap;
  final TextStyle? style;
  final TextStyle? styleValue;
  final Widget? child;
  final Widget? icon;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        height: height,
        margin:
            margin ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: child ??
            Row(
              children: [
                icon ?? const SizedBox(),
                Visibility(
                  visible: icon != null,
                  child: const SizedBox(
                    width: 12,
                  ),
                ),
                Text(
                  title!,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                value != null
                    ? Expanded(
                        child: Text(
                          value!,
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.end,
                        ),
                      )
                    : Row(
                        children: [
                          subTitle != null
                              ? Text(
                                  subTitle!,
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                              : const SizedBox(),
                          Icon(
                            Icons.navigate_next,
                            color: AppColors.contentPlaceholder,
                          ),
                        ],
                      ),
              ],
            ),
      ),
    );
  }
}
