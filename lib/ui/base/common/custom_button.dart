import 'package:flutter/material.dart';
import 'package:blog/ui/themes/app_style.dart';
import 'package:blog/ui/themes/custom_container.dart';
import 'package:blog/ui/themes/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.title,
      this.onTap,
      this.style,
      this.textColor,
      this.color,
      this.child,
      this.margin,
      this.padding,
      Key? key})
      : super(key: key);
  final String? title;

  final Function()? onTap;
  final TextStyle? style;
  final Color? color;
  final Color? textColor;
  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: color ?? const Color(0xffFFDE7A),
            borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            title ?? "LOGIN",
            style: style ??
                TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: textColor),
          ),
        ),
      ),
    );
  }
}
