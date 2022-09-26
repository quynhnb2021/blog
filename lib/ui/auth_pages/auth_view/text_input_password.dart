import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/text_styles.dart';

enum InputSecurityType { password, email }

class TextInputPassword extends HookConsumerWidget {
  const TextInputPassword(
      {this.hintText,
      this.obscureText = false,
      this.hasReadOnly = false,
      this.securityType = InputSecurityType.email,
      this.onChanged,
      required this.controller,
      this.onClear,
      this.height,
      this.type,
      Key? key})
      : super(key: key);
  final String? hintText;
  final bool obscureText;
  final bool hasReadOnly;
  final InputSecurityType securityType;
  final Function? onChanged;
  final TextEditingController controller;
  final Function? onClear;
  final double? height;
  final TextInputType? type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSecurity = useState(securityType == InputSecurityType.password);
    final isHasData = useState(false);
    useEffect(() {
      if (controller.text.isNotEmpty) {
        isHasData.value = true;
      }
      return null;
    }, [controller.text]);
    return Container(
      height: height ?? 40,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
          color: hasReadOnly
              ? Theme.of(context).disabledColor
              : Theme.of(context).backgroundColor,
          // border: Border.all(color: AppColors.contentPlaceholder),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: TextFormField(
              keyboardType: type,
              readOnly: hasReadOnly,
              controller: controller,
              obscureText: isSecurity.value,
              style: Theme.of(context).textTheme.labelSmall,
              onChanged: (value) {
                onChanged?.call(value);
                isHasData.value = value.isNotEmpty;
              },
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow)),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyles.regularText14.w400
                    .setColor(AppColors.contentPlaceholder),
              ),
            ),
          ),
          if (securityType != InputSecurityType.password &&
              (isHasData.value) &&
              hasReadOnly == false)
            IconButton(
                onPressed: () {
                  controller.clear();
                  onChanged?.call(controller.text);
                  isHasData.value = false;
                },
                icon: const Icon(Icons.clear)),
          if (securityType == InputSecurityType.password)
            IconButton(
              onPressed: () {
                isSecurity.value = !isSecurity.value;
              },
              icon: Icon(
                  !isSecurity.value ? Icons.visibility_off : Icons.visibility),
            ),
        ],
      ),
    );
  }
}
