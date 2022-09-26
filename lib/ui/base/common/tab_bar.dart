import 'package:flutter/material.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/text_styles.dart';

class AnimatedSwitch extends StatefulWidget {
  final double padding;
  final bool dark;
  final String textLeft;
  final String textRight;
  final String textCenter;
  final Function(String e) onTap;

  const AnimatedSwitch({
    Key? key,
    this.dark = true,
    this.padding = 0,
    required this.textLeft,
    required this.textCenter,
    required this.textRight,
    required this.onTap,
  }) : super(key: key);

  @override
  AnimatedSwitchState createState() => AnimatedSwitchState();
}

class AnimatedSwitchState extends State<AnimatedSwitch> {
  var isEnabled = false;
  var title = "Today";
  final datas = ["Today", "This Week", "Custom"];
  final animationDuration = const Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(4),
      height: 44,
      duration: animationDuration,
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Theme.of(context).hintColor),
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.all(Radius.elliptical(12, 21)),
      ),
      child: Row(
        children: datas
            .map<Widget>(
              (e) => buildItem(e),
            )
            .toList(),
      ),
    );
  }

  buildItem(String e) => Expanded(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(title == e
                ? AppColors.colorButtonMain
                : Theme.of(context).backgroundColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
          ),
          onPressed: () {
            setState(() {
              title = e;
            });
            widget.onTap(e);
          },
          child: Text(e,
              textAlign: TextAlign.center,
              style: TextStyles.boldText14.w600.setColor(title == e
                  ? AppColors.backgroundDarkMode
                  : AppColors.contentPlaceholder)),
        ),
      );
}
