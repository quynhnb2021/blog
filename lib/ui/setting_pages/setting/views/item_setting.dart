import 'package:flutter/material.dart';
import 'package:blog/ui/themes/app_color.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting(
      {this.title,
      this.subTitle,
      this.hasIcon,
      this.hasDivider,
      this.onTap,
      Key? key})
      : super(key: key);
  final String? title;
  final String? subTitle;
  final bool? hasIcon;
  final bool? hasDivider;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title ?? '',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      subTitle ?? '',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    hasIcon == null
                        ? Icon(
                            Icons.navigate_next,
                            color: AppColors.contentPlaceholder,
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
            hasDivider != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      color: AppColors.colorDivider,
                      height: 1,
                    ))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
